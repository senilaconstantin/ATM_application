package com.senilaconstantin.atm.repository;

import com.senilaconstantin.atm.models.Atm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AtmRepository extends JpaRepository<Atm, Integer> {
}
