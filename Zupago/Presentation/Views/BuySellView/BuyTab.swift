//
//  BuySell.swift
//  Zupago
//
//  Created by Inyene Etoedia on 19/09/2023.
//

import SwiftUI

struct BuyTab : View {
    @State var selectedCoin = "ETH"
    @State var selectedcurrency : (image: String, sign: String) = ("ng", "NGN")
    
    @State var pickedcurrency : (image: String, sign: String) = ("ng", "NGN")
    @State var search = ""
    @State var showSheet = false
    @State var showCostSheet = false
    @State var showKeyBoard = false
    let screenH = UIScreen.main.bounds.height

    let coins: [(String)] = [
    ("ETH"),
    ("BTC"),
    ("LTC"),
    ("DH")
    ]
    
    
    var body: some View{
        VStack {
            HStack {
                Text("I want to buy")
                    .foregroundColor(.black.opacity(0.3))
                Spacer()
                Text("balance: 2.874ETH")
                    .foregroundColor(.black.opacity(0.3))
            }
            
            HStack {
                
                HStack {
                    Text(selectedCoin)
                    Image(systemName: "chevron.down")
                }
                .foregroundColor(Color(UIColor.label))
                .padding(.all, 10)
                .background{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray ,lineWidth: 1)
                }
                .onTapGesture {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet) {
                    ForEach(0..<4) { index in
                        Text(coins[index])
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.1))
                            }
                            .padding()
                            .onTapGesture {
                                selectedCoin = coins[index]
                                showSheet = false
                            }
                      
                    }
                    .presentationDetents([.medium, .large])
                }
                
                
                Spacer()
                Text("2.00ETH")
                    .font(.custom(.bold, size: 16))
                    .foregroundColor(.black.opacity(0.3))
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray.opacity(0.07))
            }
            
            
            Spacer()
                .frame(height: 20)
            HStack {
                
                HStack {
                    Image(selectedcurrency.image)
                        .font(.system(size: 10))
                    Text(selectedcurrency.sign)
                    Image(systemName: "chevron.down")
                }
                .foregroundColor(Color(UIColor.label))
                .padding(.all, 10)
                .background{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray ,lineWidth: 1)
                }
                .onTapGesture {
                    showCostSheet = true
                }
                .sheet(isPresented: $showCostSheet) {
                    VStack {
                        Spacer()
                            .frame(height: 50)
                        
                        HStack(alignment: .top) {
                            VStack (spacing: 10) {
                                Text("Select Account")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                  
                                Text("Select an account you would like to pay with")
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        Image(systemName: "xmark")
                                .font(.system(size: 15))
                                .padding(5)
                                .background(AppColor.primary.opacity(0.1))
                                .onTapGesture {
                                    showCostSheet = false
                                }
                    
                        }
                        
        
                        
                        Spacer()
                            .frame(height: 10)
     
                        ForEach(currencies.indices, id: \.self) { index in

                            CurrencyView(
                                selected: $pickedcurrency,
                                currencies: currencies[index], action: {
                                    pickedcurrency = (currencies[index].logo, currencies[index].sign)
                                })
                            if index == currencies.indices.last {
                                Spacer()
                                    .frame(height: 20)
                                Button {
                                    showCostSheet = false
                                    selectedcurrency = pickedcurrency
                                } label: {
                                    Text("Select")
                                        .foregroundColor(Color.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(AppColor.primary)
                                        .cornerRadius(5)
                                }
                            }
                        }

                    }
                    .padding(.horizontal, 20)
                    .frame(maxHeight: .infinity, alignment:.top)
                    .presentationDetents([.medium])

                }
                
                Spacer()
                Text("2.00ETH")
                    .font(.custom(.bold, size: 16))
                    .foregroundColor(.black.opacity(0.3))
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray.opacity(0.07))
            }
            
            Spacer()
             
             Button {
             showKeyBoard = true
             } label: {
                 Text("Proceed with payment")
                     .foregroundColor(Color.white)
                     .frame(maxWidth: .infinity)
                     .frame(height: 50)
                     .background(AppColor.primary)
                     .cornerRadius(5)
                     .padding()
             }
         
        }
        .sheet(isPresented: $showKeyBoard, content: {
           PINCodeView()
                .interactiveDismissDisabled()
                .presentationDetents([.height(screenH / 1.5)])
        })
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct BuySell_Previews: PreviewProvider {
    static var previews: some View {
        BuyTab()
    }
}


