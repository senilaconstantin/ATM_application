//
//  BalanceView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

struct BalanceView: View {
    @EnvironmentObject var verificationVM: VerificationViewModel
    @State var balanceVM: BalanceViewModel = .init()
    @State var isShowing: Bool = false
    @Binding var viewType: ViewType
    
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Current balance: \(balanceVM.balance) RON")
                
                Button(action: {
                    isShowing = true
                }) {
                    HStack{
                        Spacer()
                        Text("OK")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                }
            }
            .padding([.leading, .trailing], 20)
            BalancePopUpView(isShowing: $isShowing, viewType: $viewType)
                            .environmentObject(verificationVM)
        }
    }
}
