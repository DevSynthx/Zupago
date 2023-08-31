//
//  BuyAndSell.swift
//  Zupago
//
//  Created by Inyene Etoedia on 31/08/2023.
//

import SwiftUI

struct BuyAndSell: View {
    @State var selectedTab = 1
    @Namespace private var tabNameSpace

    let tabs: [(String)] = [
        ( "Buy"),
        ("Sell"),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 30) {
                ForEach(0..<2){ index in
                    Button {
                        selectedTab = index + 1
                    } label: {
                        VStack {
                            if index + 1  == selectedTab {
                                Capsule()
                                    .padding(.horizontal, 10)
                                    .frame(height: 45)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(AppColor.white)
                                    .shadow(color: .gray.opacity(0.1), radius: 5, y: 5)
                                    .matchedGeometryEffect(id: "selectedTab", in: tabNameSpace )
                                    .overlay{
                                        Text(tabs[index])
                                            .foregroundColor(index + 1  == selectedTab ? .black : .gray)
                                            .padding()
                                           
                                    }
                            }
                            else
                            {
                                Capsule()
                                    .padding(.horizontal, 10)
                                    .frame(height: 45)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text(tabs[index])
                                            .padding()
                                            .foregroundColor(.gray)
                                           
                                    }
                            }
                        }
                    }
                }
            }
            .background{
                Capsule()
                    .padding(.vertical, -5)
                    .padding(.horizontal, 5)
                    .foregroundColor(.gray.opacity(0.2))
            }
            Spacer()
                .frame(height: 20)
            switch selectedTab {
            case 1:
                BuyView()
            case 2:
                Text("Second Tab Content")
            default:
                EmptyView()
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}


struct BuyAndSell_Previews: PreviewProvider {
    static var previews: some View {
        BuyAndSell()
    }
}



struct BuyView : View {
    @State var selectedCoin = "ETH"
    @State var selectedcurrency = "Naira"
    @State var search = ""
    @State var showSheet = false
    @State var showCostSheet = false
    let coins: [(String)] = [
    
    ("ETH"),
    ("BTC"),
    ("LTC"),
    ("DH")
    ]
    
    let currency: [(String)] = [
    
    ("Naira"),
    ("Dollars"),
    ("Pounds"),
    ("Euro")
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
                    .foregroundColor(.gray.opacity(0.1))
            }
            
            
            Spacer()
                .frame(height: 20)
            HStack {
                
                HStack {
                    Text(selectedcurrency)
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
                            .frame(height: 10)
                        
                        ForEach(0..<4) { index in
                            Text(currency[index])
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background {
                                    Rectangle()
                                        .foregroundColor(.gray.opacity(0.1))
                                }
                                .padding(.vertical, 10)
                                .onTapGesture {
                                    selectedcurrency = currency[index]
                                    showCostSheet = false
                                }
                          
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(maxHeight: .infinity, alignment:.top)
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
                    .foregroundColor(.gray.opacity(0.1))
            }
            
            
         
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}






struct DefaultTabbar: View {
    @Binding var tabSelection: Int
    @Namespace private var tabNameSpace
    
    let tabs: [(String)] = [
        ( "Buy"),
        ("Sell"),
    ]
    var body: some View{
        ZStack {
            Capsule()
                .frame(height: 60)
                .foregroundColor(.gray.opacity(0.2))
                .shadow(color: .gray.opacity(0.2), radius: 20, y: -10)
            HStack(spacing: 30) {
                ForEach(0..<2){ index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack {
                            
                            if index + 1  == tabSelection {
                                Capsule()
                                    .padding(.horizontal, 10)
                                    .frame(height: 45)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(AppColor.primary)
                                    .matchedGeometryEffect(id: "selectedTab", in: tabNameSpace )
                                    .overlay{
                                        Text(tabs[index])
                                            .padding()
                                           
                                    }
                            }
                            else
                            {
                                Capsule()
                                    .padding(.horizontal, 10)
                                    .frame(height: 45)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text(tabs[index])
                                            .padding()
                                           
                                    }
                            }
                        }
                    }
                }
            }
            //
            .frame(height: 61)
            //.clipShape(Rectangle())
           // .padding(.bottom, 10)
        }
        .padding(.horizontal,20)
        .frame(maxWidth: .infinity)
    }
}
