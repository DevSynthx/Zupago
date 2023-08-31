//
//  customTab.swift
//  Zupago
//
//  Created by Inyene Etoedia on 30/08/2023.
//

import SwiftUI

struct CustomTab: View {
    @Binding var tabSelection: Int
    @Namespace private var tabNameSpace
    let tabs: [(image: String, title: String)] = [
        ("homeTab", "Home"),
        ("walletTab", "Wallet"),
        ("cardTab", "Cards"),
        ("marketTab", "Market"),
        ("userTab", "Account"),
    ]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(height: 83)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.15), radius: 20, y: -10)
                .padding(.bottom, -12)
            HStack(spacing: 30) {
                    ForEach(0..<5){ index in
                        Button {
                            tabSelection = index + 1
                        } label: {
                            VStack {
                                
                                if index + 1  == tabSelection {
                                    Capsule()
                                        .frame(width: 30, height: 5)
                                        .foregroundColor(AppColor.primary)
                                        .matchedGeometryEffect(id: "selectedTab", in: tabNameSpace )
                                }
                                else{
                                    Capsule()
                                        .frame(width: 20, height: 5)
                                        .foregroundColor(.clear)
                                    
                                }
                                Spacer()
                                    .frame(height: 10)
                                Image( tabs[index].image)
                                    .colorMultiply(index + 1  == tabSelection ? AppColor.primary : .gray.opacity(0.5))
                                Text(tabs[index].title)
                                    .font(.custom(.light, size: 15))
                                    .foregroundColor(index + 1  == tabSelection ? AppColor.primary : .gray.opacity(0.6))
                                    
                            }
                        }
                    }
                }
           //
            .frame(height: 61)
            .clipShape(Rectangle())
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        
        
    }
}

struct CustomTab_Previews: PreviewProvider {
    static var previews: some View {
        CustomTab(tabSelection: .constant(4))
    }
}
