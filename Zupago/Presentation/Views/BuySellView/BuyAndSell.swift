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
    @EnvironmentObject var route: Router<Routes>

    let tabs: [(String)] = [
        ( "Buy"),
        ("Sell"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 10)
            HStack(spacing: 20) {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(10)
                    .background{
                        Rectangle()
                            .foregroundColor(AppColor.primary.opacity(0.07))
                    }
                 
                Text("Buy/Sell Crypto")
                    .foregroundColor(Color.black)
            }
            .onTapGesture {
                route.popLast()
            }
            Spacer()
                .frame(height: 30)
            HStack(spacing: 30) {
                ForEach(0..<2){ index in
                    Button {
                        selectedTab = index + 1
                    } label: {
                        VStack {
                            if index + 1  == selectedTab {
                                Capsule()
                                    .padding(.horizontal, 5)
                                    .frame(height: 35)
                                    .frame(maxWidth: .infinity)
                                    .padding(4)
                                    .foregroundColor(AppColor.white)
                                    .shadow(color: .gray.opacity(0.1), radius: 5, y: 5)
                                    .matchedGeometryEffect(id: "selectedTab", in: tabNameSpace )
                                    .overlay{
                                        Text(tabs[index])
                                            .font(.system(size: 15))
                                            .foregroundColor(index + 1  == selectedTab ? .black : .gray)
                                            .padding()
                                           
                                    }
                            }
                            else
                            {
                                Capsule()
                                    .padding(.horizontal, 10)
                                    .frame(height: 35)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.clear)
                                    .overlay{
                                        Text(tabs[index])
                                            .font(.system(size: 15))
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
                    .padding(.vertical, 0)
                    .padding(.horizontal, 5)
                    .foregroundColor(.gray.opacity(0.1))
            }
            Spacer()
                .frame(height: 20)
            switch selectedTab {
            case 1:
                BuyTab()
            case 2:
                Text("Second Tab Content")
            default:
                EmptyView()
            }
            
        }

        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
}


struct BuyAndSell_Previews: PreviewProvider {
    static var previews: some View {
        BuyAndSell()
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
                                            .font(.system(size: 10))
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
                                            .font(.system(size: 10))
                                            .padding()
                                           
                                    }
                            }
                        }
                    }
                }
            }
            //
            .frame(height: 61)
          
        }
        .padding(.horizontal,20)
        .frame(maxWidth: .infinity)
    }
}
