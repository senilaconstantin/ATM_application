package com.senilaconstantin.atm.service;


import com.senilaconstantin.atm.dto.CardDTO2;
import com.senilaconstantin.atm.dto.CardDto;
import com.senilaconstantin.atm.dto.CardLogin;
import com.senilaconstantin.atm.models.Card;
import com.senilaconstantin.atm.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CardService {
    private final CardRepository cardRepository;

    @Autowired
    public CardService(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    public void addCard(CardDto cardDto) {
        Card card = new Card(cardDto);
        cardRepository.save(card);
    }

    public CardDTO2 login(CardLogin cardLogin) throws Exception {
        Optional<Card> cardOptional = cardRepository.findByNumberAndPin(cardLogin.getNumber(), cardLogin.getPin());
        if(!cardOptional.isPresent()) {
            throw new Exception();
        }
        CardDTO2 cardDto2 = new CardDTO2(cardOptional.get());
        return cardDto2;
    }
}
