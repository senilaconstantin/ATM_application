package com.senilaconstantin.atm.controller;

import com.senilaconstantin.atm.dto.CardDTO2;
import com.senilaconstantin.atm.dto.CardDto;
import com.senilaconstantin.atm.dto.CardLogin;
import com.senilaconstantin.atm.dto.MessageDto;
import com.senilaconstantin.atm.models.Card;
import com.senilaconstantin.atm.service.AtmService;
import com.senilaconstantin.atm.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/atm")
public class AtmController {
    private final AtmService atmService;
    private final CardService cardService;
    @Autowired
    public AtmController(AtmService atmService, CardService cardService) {
        this.atmService = atmService;
        this.cardService = cardService;
    }

    @PostMapping("/")
    public void addCard(@RequestBody CardDto cardDto) {
        cardService.addCard(cardDto);
    }

    @PostMapping("/login")
    public CardDTO2 login(@RequestBody CardLogin cardLogin) throws Exception {
        return cardService.login(cardLogin);
    }

    @PutMapping("/withdraw")
    public MessageDto withdrawAmount(@RequestParam(name = "amount") Integer amount, @RequestBody CardDTO2 card) {
       return atmService.withdrawAmount(amount, card);
    }
}
