package com.senilaconstantin.atm.models;

import com.senilaconstantin.atm.dto.CardDto;
import com.senilaconstantin.atm.dto.type.CardType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "card", uniqueConstraints = @UniqueConstraint(columnNames = "number"))
public class Card {

    @Id
    @GeneratedValue
    private Integer id;
    private String number;
    private String pin;
    private Integer sold;
    @Enumerated(EnumType.STRING)
    private CardType cardType;

    public Card(CardDto cardDto) {
        this.number = cardDto.getNumber();
        this.pin = "1234";
        this.cardType = cardDto.getCardType();
        if(cardType.equals(CardType.GOLD)) {
            this.sold = 1000;
        } else if(cardType.equals(CardType.BASIC)) {
            this.sold = 500;
        }
    }
}
