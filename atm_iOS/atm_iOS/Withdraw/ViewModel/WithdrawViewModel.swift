//
//  WithdrawViewModel.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

class WithdrawViewModel: ObservableObject {
    
    func withdraw(amount: Int,
                  responseWithdraw: @escaping (_ error: String) -> Void) {
        APIClient.shared.withdrawUser(card: CurrentCard.shared.getCard(), amount: amount) { error in
            DispatchQueue.main.async {
                responseWithdraw(error)
            }
        }
        
    }
}
