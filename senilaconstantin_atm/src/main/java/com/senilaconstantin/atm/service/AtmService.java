package com.senilaconstantin.atm.service;

import com.senilaconstantin.atm.dto.CardDTO2;
import com.senilaconstantin.atm.dto.MessageDto;
import com.senilaconstantin.atm.models.Atm;
import com.senilaconstantin.atm.models.Card;
import com.senilaconstantin.atm.repository.AtmRepository;
import com.senilaconstantin.atm.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AtmService {
    private final AtmRepository atmRepository;
    private final CardService cardService;
    private final CardRepository cardRepository;

    @Autowired
    public AtmService(AtmRepository atmRepository, CardService cardService, CardRepository cardRepository) {
        this.atmRepository = atmRepository;
        this.cardService = cardService;
        this.cardRepository = cardRepository;
    }

    @Bean
    public void add() {
        atmRepository.deleteAll();
        Atm atm = new Atm();
        atmRepository.save(atm);
    }

    public void updateATMDay() {
        List<Atm> atmList = atmRepository.findAll();
        for (Atm atm : atmList) {
            atm.setAtm();
            atmRepository.save(atm);
        }
    }

    public MessageDto withdrawAmount(Integer amount, CardDTO2 cardDto) {
        Optional<Card> cardOptional = cardRepository.findByNumber(cardDto.getNumber());
        if (!cardOptional.isPresent()) {
            return new MessageDto("Error Card");
        }
        Card card = cardOptional.get();
        List<Atm> atmList = atmRepository.findAll();
        if (atmList.size() > 0) {
            Atm atm = atmList.get(0);
            HashMap<Integer, Integer> bills = atm.getBills();
            TreeMap<Integer, Integer> treeMap = new TreeMap<>(Comparator.reverseOrder());
            treeMap.putAll(bills);
            int availableBalance = 0;

            // Calculating available balance
            int remainingAmountVer = amount;
            for (Map.Entry<Integer, Integer> bill : treeMap.entrySet()) {
                availableBalance += bill.getKey() * bill.getValue();
                int billValue = bill.getKey();
                int numBills = bill.getValue();

                // Verifica dacă ATM-ul are suficiente bancnote pentru bancnota curentă
                int numNeededBills = remainingAmountVer / billValue;
                int numWithdrawnBills = Math.min(numNeededBills, numBills);
                remainingAmountVer -= numWithdrawnBills * billValue;
            }

            // Check if amount is valid and a multiple of 10
            if (amount % 10 != 0) {
                return new MessageDto("Amount entered is not a multiple of 10");
            }

            // Check if amount is greater than the card balance
            if (amount > card.getSold()) {
                return new MessageDto("Insufficient Funds");
            }

            // Check if ATM has enough bills to cover the withdrawal
            if (amount > availableBalance || remainingAmountVer != 0) {
                return new MessageDto("The machine does not have enough funds, please enter a smaller amount");
            }

            // Deducting amount from card balance and updating ATM bills
            int remainingAmount = amount;
            for (Map.Entry<Integer, Integer> bill : treeMap.entrySet()) {
                int billValue = bill.getKey();
                int numBills = bill.getValue();
                if (remainingAmount >= billValue) {
                    int numWithdrawnBills = remainingAmount / billValue;
                    if (numWithdrawnBills > numBills) {
                        numWithdrawnBills = numBills;
                    }
                    remainingAmount -= numWithdrawnBills * billValue;
                    if (billValue == 500) {
                        atm.setNumBills500(numBills - numWithdrawnBills);
                    } else if (billValue == 200) {
                        atm.setNumBills200(numBills - numWithdrawnBills);
                    } else if (billValue == 100) {
                        atm.setNumBills100(numBills - numWithdrawnBills);
                    } else if (billValue == 50) {
                        atm.setNumBills50(numBills - numWithdrawnBills);
                    } else if (billValue == 20) {
                        atm.setNumBills20(numBills - numWithdrawnBills);
                    } else if (billValue == 10) {
                        atm.setNumBills10(numBills - numWithdrawnBills);
                    } else if (billValue == 5) {
                        atm.setNumBills5(numBills - numWithdrawnBills);
                    }
                }
            }
            card.setSold(card.getSold() - amount);
            atmRepository.save(atm);
            cardRepository.save(card);
            return new MessageDto("Transaction successful");
        } else {
            return new MessageDto("ATM not found");
        }
    }

}
