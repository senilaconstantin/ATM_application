//
//  MessageR.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import Foundation
struct MessageR: Codable {
    var message: String

    init(message: String) {
        self.message = message
    }
}
