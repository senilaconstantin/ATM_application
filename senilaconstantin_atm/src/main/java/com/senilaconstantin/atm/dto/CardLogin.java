package com.senilaconstantin.atm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CardLogin {
    private String number;
    private String pin;
}
