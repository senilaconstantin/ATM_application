package com.senilaconstantin.atm.controller;

import com.senilaconstantin.atm.dto.CardDto;
import com.senilaconstantin.atm.dto.CardLogin;
import com.senilaconstantin.atm.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/card")
public class CardController {
    private final CardService cardService;

    @Autowired
    public CardController(CardService cardService) {
        this.cardService = cardService;
    }

//    @PostMapping("/")
//    public void addCard(@RequestBody CardDto cardDto) {
//        cardService.addCard(cardDto);
//    }

}
