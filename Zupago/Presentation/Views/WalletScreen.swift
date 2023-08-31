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
            WalletTopView()
            CoinListView()
            
        
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .edgesIgnoringSafeArea(.top)
    }
}


 @ViewBuilder
func WalletTopView()-> some View{
    let buttons: [(image: String, title: String)] = [
        ("homeTab", "Send"),
        ("walletTab", "Receive"),
        ("bitcoin", "Buy/Sell"),
        ("coinline", "Swap"),
    ]
    
    
    VStack {
        Spacer()
            .frame(height: 70)
        HStack {
            Text("Wallet")
                .font(.custom(.medium, size: 20))
                .foregroundColor(.white)
            Spacer()
            Image("chartIcon")
                  .resizable()
                  .frame(width: 20, height: 20)
                  .padding(.vertical, 6)
                  .padding(.horizontal, 6)
                  .background{
                      Rectangle()
                          .foregroundColor(.white.opacity(0.1))
                  }
            
          Image("notification")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.vertical, 6)
                .padding(.horizontal, 6)
                .background{
                    Rectangle()
                        .foregroundColor(.white.opacity(0.1))
                }
        }
        
        AmountCard(text: "Total Portfolio Value")
            .padding(.trailing, 5)
        
        
        Spacer()
            .frame(height: 20)
        HStack {
            
            ForEach(0..<4) { index in
                
                VStack {
                    Image(buttons[index].image)
                        .colorMultiply(AppColor.white)
                        .frame(width: 15, height: 15)
                        .padding(15)
                        .background{
                            RoundedRectangle(cornerRadius: 5, style: .continuous).fill()
                                .foregroundColor(.white.opacity(0.2))
                        }
                        .overlay {
                            RoundedRectangle(
                                cornerRadius: 5,
                                style: .continuous
                            )
                            .stroke(.blue, lineWidth: 2)
                        }
                    
                        .frame(width: 10)
                    Text(buttons[index].title)
                        .font(.custom(.regular, size: 16))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 10)
                
            }
        
            
        }
        .padding(.bottom, 30)
    
    }
    .padding(.horizontal, 20)
    .background{
        Rectangle()
            .foregroundColor(AppColor.primary)
            .frame(maxWidth:.infinity)
            .cornerRadius(radius: 10, corners: [.bottomLeft, .bottomRight])
            .shadow(color: .black, radius: 5)
    }
}







struct WalletScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalletScreen()
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



