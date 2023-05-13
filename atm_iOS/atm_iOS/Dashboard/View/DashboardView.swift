//
//  DashboardView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var verificationVM: VerificationViewModel
    @State var dashboardVM: DashboardViewModel = .init()
    @State var viewType: ViewType = .dashboard
    var body: some View {
        switch viewType {
        case .dashboard:
            content
        case .balance:
            BalanceView(viewType: $viewType)
                .environmentObject(verificationVM)
        case .withdraw:
            WithdrawView(viewType: $viewType)
                .environmentObject(verificationVM)
        }
    }
    @ViewBuilder private var content: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Exit")
                        .onTapGesture {
                            CurrentCard.shared.logout()
                            verificationVM.ver()
                        }
                    Spacer()
                }
                Spacer()
                Button(action: {
                    viewType = .balance
                }) {
                    HStack{
                        Spacer()
                        Text("1. Display the balance!")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                }
                
                Button(action: {
                    viewType = .withdraw
                }) {
                    HStack{
                        Spacer()
                        Text("2. Start a withdrawal!")
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                }
                Spacer()
            }
            .padding([.leading, .trailing, .top], 30)
            
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
