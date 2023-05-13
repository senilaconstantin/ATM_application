//
//  LoginView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//
//-

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var verificationVM: VerificationViewModel
    @State private var number: String = ""
    @State private var pin: String = ""
    @State var errorMessage: String = ""
    @State var loginVM: LoginViewModel = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.system(size: 45))
            VStack {
                TextField("Number Card", text: $number)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Pin", text: $pin)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button(action: {
                    loginVM.login(number: number, pin: pin) { error in
                        DispatchQueue.main.async {
                            verificationVM.ver()
                            if error == "" {
                                verificationVM.ver()
                            } else {
                                errorMessage = error
                            }
                        }
                    }
                    
//                    APIClient.shared.loginUser(number: number, pin: pin) { card, error in
//                        DispatchQueue.main.async {
//                            if let card = card {
//                                print("Succes Login: \(card.number)")
//                            } else {
//                                print("Error \(error ?? "")")
//                                errorMessage = "Wrong number or pin!"
//                            }
//                        }
//                    }
                }) {
                    HStack{
                        Spacer()
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                }
            }
            .padding([.leading, .trailing, .top], 30)
            Spacer()
        }
        .padding()
        .alert(isPresented: .constant(errorMessage != "")) {
            Alert(title: Text("Error!"), message: Text(errorMessage), dismissButton: .default(Text("OK"), action: {
                errorMessage = ""
            }))
        }
    }
}

