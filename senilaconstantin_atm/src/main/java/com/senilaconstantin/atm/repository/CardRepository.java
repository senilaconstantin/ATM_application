package com.senilaconstantin.atm.repository;

import com.senilaconstantin.atm.models.Card;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface CardRepository extends JpaRepository<Card, Integer> {

    Optional<Card> findByNumberAndPin(String number, String pin);
    Optional<Card> findByNumber(String number);
    List<Card> findAll();

}

