package com.senilaconstantin.atm.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
@Data
@Builder
@AllArgsConstructor
@Entity
public class Atm {
    @Id
    @GeneratedValue
    private Integer id;
    private int numBills500;
    private int numBills200;
    private int numBills100;
    private int numBills50;
    private int numBills20;
    private int numBills10;
    private int numBills5;

    public Atm() {
        numBills500 = 10;
        numBills200 = 10;
        numBills100 = 10;
        numBills50 = 10;
        numBills20 = 10;
        numBills10 = 10;
        numBills5 = 10;
    }

//    public Atm() {
//        numBills500 = 0;
//        numBills200 = 0;
//        numBills100 = 0;
//        numBills50 = 10;
//        numBills20 = 0;
//        numBills10 = 1;
//        numBills5 = 0;
//    }

    public void setAtm() {
        numBills500 = 10;
        numBills200 = 10;
        numBills100 = 10;
        numBills50 = 10;
        numBills20 = 10;
        numBills10 = 10;
        numBills5 = 10;
    }

    public HashMap<Integer, Integer>getBills() {
        HashMap bills = new HashMap<>();
        bills.put(500, this.numBills500);
        bills.put(200, this.numBills200);
        bills.put(100, this.numBills100);
        bills.put(50, this.numBills50);
        bills.put(20, this.numBills20);
        bills.put(10, this.numBills10);
        bills.put(5, this.numBills5);
        return bills;
    }
}
