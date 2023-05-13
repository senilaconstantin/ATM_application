//
//  LoginModel.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

public struct LogInModel: Encodable {
    public var number: String
    public var pin: String
    
    public init(number: String, pin: String) {
        self.number = number
        self.pin = pin
    }
    enum CodingKeys: String, CodingKey {
        case number, pin
    }
}
