//
//  BalancePopUpView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

struct BalancePopUpView: View {
    @EnvironmentObject var verificationVM: VerificationViewModel
    @Binding var isShowing: Bool
    @Binding var viewType: ViewType
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                BackdropView()
                    .blur(radius: 5.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    mainView
                        .transition(.move(edge: .bottom))
                    
                    Spacer()
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    var mainView: some View {
        VStack (spacing: 10){
            HStack{
                Button {
                    isShowing = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.black)
                }
                Spacer()
            }
            .padding([.leading, .trailing, .top], 20)
            
            Text("Do you want to do another operation?")
            
            HStack(spacing: 20) {
                Button {
                    isShowing = false
                    CurrentCard.shared.logout()
                    verificationVM.ver()
                } label: {
                    HStack{
                        Spacer()
                        Text("No")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding([.all], 20)
                }
                
                
                Button {
                    viewType = .dashboard
                    isShowing = false
                } label: {
                    HStack{
                        Spacer()
                        Text("Yes")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding([.all], 20)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4)
        .background(Color.yellow.opacity(0.9))
        .cornerRadius(20)
        .padding([.leading, .trailing], 15)
        
    }
}
