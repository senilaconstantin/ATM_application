//
//  LoginViewModel.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

import SwiftUI

class LoginViewModel: ObservableObject {
    
    func login(number: String, pin: String, completionHandler: @escaping (_ error: String) -> Void) {
        APIClient.shared.loginUser(number: number, pin: pin) { card, error in
            DispatchQueue.main.async {
                if let card = card {
                    print("Succes Login: \(card.number)")
                    completionHandler("")
                } else {
                    print("Error \(error ?? "")")
                    completionHandler("Wrong number or pin!")
                }
            }
        }
    }
    
}
