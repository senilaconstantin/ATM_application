//
//  BalanceViewModel.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

class BalanceViewModel: ObservableObject {
    @Published var balance: Int = 0
    init() {
        initSold()
    }
    
    func initSold() {
        balance = CurrentCard.shared.getCard().sold
    }
}
