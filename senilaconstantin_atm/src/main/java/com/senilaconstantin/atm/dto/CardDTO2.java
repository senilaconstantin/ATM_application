package com.senilaconstantin.atm.dto;

import com.senilaconstantin.atm.dto.type.CardType;
import com.senilaconstantin.atm.models.Card;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CardDTO2 {
    private String number;
    private Integer sold;

    public CardDTO2(Card card) {
        this.number = card.getNumber();
        this.sold = card.getSold();
    }
}
