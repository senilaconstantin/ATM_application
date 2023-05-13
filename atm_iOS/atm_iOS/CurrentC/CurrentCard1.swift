//
//  CurrentCard.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

class CurrentCard {
    static let shared = CurrentCard()
    private let defaults = UserDefaults.standard
    
    func isLoggedIn() -> Bool {
        var card: Card = .init(number: "", sold: 0)
        if let savedData = defaults.object(forKey: "card") as? Data {
            let decoder = JSONDecoder()
            if let cardt = try? decoder.decode(Card.self, from: savedData) {
                card = cardt
            }
        }
        return card.number != ""
    }
    
    func updateSold(amount: Int) {
        var card = getCard()
        card.sold -= amount
        logout()
        saveCard(card: card)
    }
    
    func getCard() -> Card {
        var cardR: Card = .init(number: "", sold: 0)
        if let savedData = defaults.object(forKey: "card") as? Data {
            let decoder = JSONDecoder()
            if let card = try? decoder.decode(Card.self, from: savedData) {
                cardR = card
            }
        }
        return cardR
    }
    
    func saveCard(card: Card) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(card) {
            defaults.set(encodedData, forKey: "card")
        } else {
            print("Error save Card!")
        }
    }
    
    func logout() {
        let card = Card(number: "", sold: 0)
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(card) {
            defaults.set(encodedData, forKey: "card")
        } else {
            print("Error deleteToken!")
        }
    }
}

