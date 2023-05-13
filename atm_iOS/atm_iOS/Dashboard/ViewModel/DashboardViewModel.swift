//
//  DashboardViewModel.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var card: Card = .init(number: "", sold: 0)
    init() {
        cardInit()
    }
    
    func cardInit() {
        var cd = CurrentCard.shared.getCard()
        if cd.number != "" {
            card = cd
        }
    }
}
