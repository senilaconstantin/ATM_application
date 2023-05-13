package com.senilaconstantin.atm.dto;

import com.senilaconstantin.atm.models.Card;
import com.senilaconstantin.atm.dto.type.CardType;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CardDto {
    private Integer id;
    private String number;
    private String pin;
//    private Integer sold;
    @Enumerated(EnumType.STRING)
    private CardType cardType;

    public CardDto(Card card) {
        this.id = card.getId();
        this.number = card.getNumber();
        this.pin = card.getPin();
//        this.sold = card.getSold();
        this.cardType = card.getCardType();
    }
}
