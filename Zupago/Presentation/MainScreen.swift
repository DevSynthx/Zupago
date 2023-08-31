//
//  MainScreen.swift
//  Zupago
//
//  Created by Inyene Etoedia on 30/08/2023.
//

import SwiftUI

struct MainScreen: View {
    @State var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tag(1)
            WalletScreen()
                .tag(2)
            CardScreen()
                .tag(3)
            AccountScreen()
                .tag(4)
            
        }
  
        .overlay(alignment: .bottom) {
            CustomTab(tabSelection: $selectedTab)
                .padding(.bottom, 30)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(ChipViewModel())
    }
}
