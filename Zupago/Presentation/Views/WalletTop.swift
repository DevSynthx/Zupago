//
//  WalletTop.swift
//  Zupago
//
//  Created by Inyene Etoedia on 18/09/2023.
//

import SwiftUI

struct WalletTop: View {
    @EnvironmentObject var router: Router<Routes>
    let buttons: [(image: String, title: String)] = [
        ("homeTab", "Send"),
        ("walletTab", "Receive"),
        ("bitcoin", "Buy/Sell"),
        ("coinline", "Swap"),
    ]
    var body: some View {
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
                            .colorMultiply(Color.white)
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
                    .onTapGesture {
                        switch buttons[index].title {
                        case "Send": router.push(.BuySell)
                        default:
                            return
                            
                        }
                    }
                    
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
}

struct WalletTop_Previews: PreviewProvider {
    static var previews: some View {
        WalletTop()
    }
}
