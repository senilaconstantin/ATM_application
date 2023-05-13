package com.senilaconstantin.atm;

import com.senilaconstantin.atm.service.AtmService;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class SchedulingConfig {
    private final AtmService atmService;

    public SchedulingConfig(AtmService atmService) {
        this.atmService = atmService;
    }

    @Scheduled(cron = "0 0 0 * * *")
    public void updateATM() {
        atmService.updateATMDay();
    }
}
