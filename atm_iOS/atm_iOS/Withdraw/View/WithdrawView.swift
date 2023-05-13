//
//  WithdrawView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

struct WithdrawView: View {
    @EnvironmentObject var verificationVM: VerificationViewModel
    @Binding var viewType: ViewType
    @State private var amount: String = ""
    @State var isShowing: Bool = false
    @State var withdrawVM: WithdrawViewModel = .init()
    @State var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Make a withdrawal")
                
                TextField("Enter a valid amount that is a multiple of 10 (eg, “200”, “20”, “50”)", text: $amount)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button(action: {
                    withdrawVM.withdraw(amount: Int(amount) ?? 0) { error in
                        if error == "Transaction successful" {
                            isShowing = true
                        } else {
                            errorMessage = error
                        }
                    }
//                    viewType = .withdraw
                }) {
                    HStack{
                        Spacer()
                        Text("Withdrawal amount!")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                }
            }
            .padding(.all, 20)
            .alert(isPresented: .constant(errorMessage != "")) {
                Alert(title: Text("Error!"), message: Text(errorMessage), dismissButton: .default(Text("OK"), action: {
                    errorMessage = ""
                }))
            }
            BalancePopUpView(isShowing: $isShowing, viewType: $viewType)
                            .environmentObject(verificationVM)
        }
    }
}


