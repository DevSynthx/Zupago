//
//  WalletScreen.swift
//  Zupago
//
//  Created by Inyene Etoedia on 30/08/2023.
//

import SwiftUI

struct WalletScreen: View {
    var body: some View {
        VStack {
            WalletTop()
            CoinListView()
        
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .edgesIgnoringSafeArea(.top)
    }
}




struct WalletScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalletScreen()
            .environmentObject(Router(root: Routes.BuySell))

    }
}


struct CoinListView:  View {
    @State var search: String = ""
    var body: some View {
        
        let coins : [(name: String, amount: Int, coinVal: CGFloat, otherAmount: Int)] = [
            ("Bitcoin", 1200, 4.5, 234 ),
            ("Ethereum", 1200, 4.5, 234 ),
            ("Litecoin", 1200, 4.5, 234 ),
        ]
        
        VStack (alignment: .leading){
            Spacer()
                .frame(height: 30)
            Text("Assets")
                .font(.custom(.medium, size: 16))
                .foregroundColor(.black)
            
            TextField("Search Assets", text: $search)
                .font(.custom(.regular, size: 16))
                .padding(.horizontal, 40)
                .frame(height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                )
            Spacer()
                .frame(height: 40)
            ForEach(0..<3) { index in
                HStack {
                    VStack(alignment:.leading) {
                        Text(coins[index].name)
                            .font(.custom(.light, size: 15))
                        Text(coins[index].otherAmount.description)
                            .font(.custom(.light, size: 15))
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(coins[index].coinVal.description)
                            .font(.custom(.light, size: 15))
                        Text(coins[index].name)
                            .font(.custom(.light, size: 15))
                    }
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(AppColor.primary.opacity(0.1), lineWidth: 2)
                }
            }
            
        }
        .padding(.horizontal, 20)
    }
}



