//
//  VerView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

struct VerView: View {
    @StateObject var verificationVM: VerificationViewModel = .init()
    var body: some View {
        if verificationVM.isLogged {
            DashboardView()
                .environmentObject(verificationVM)
        } else {
            LoginView()
                .environmentObject(verificationVM)
        }
    }
}
