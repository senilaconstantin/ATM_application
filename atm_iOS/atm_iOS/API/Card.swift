//
//  Card.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import Foundation

struct Card: Codable {
    var number: String
    var sold: Int

    init(number: String, sold: Int) {
        self.number = number
        self.sold = sold
    }
}
