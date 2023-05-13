//
//  atm_iOSApp.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

@main
struct atm_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            VerView()
        }
    }
}
