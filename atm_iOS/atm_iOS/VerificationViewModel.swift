//
//  VerificationViewModel.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

class VerificationViewModel: ObservableObject {
    @Published var isLogged: Bool = false
    
    init() {
        isLogged = CurrentCard.shared.isLoggedIn()
    }
    func ver() {
        isLogged = CurrentCard.shared.isLoggedIn()
    }
}
