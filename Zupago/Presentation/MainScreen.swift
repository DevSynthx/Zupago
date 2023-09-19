//
//  MainScreen.swift
//  Zupago
//
//  Created by Inyene Etoedia on 30/08/2023.
//



class VirtualCardVm : ObservableObject {
    @Published private var hasCard: Bool = false
    
    var value: Bool {
        get {
            return hasCard
        }
        
        set(newVal){
            hasCard = newVal
        }
    }
    
    
}
import SwiftUI

struct MainScreen: View {
    @State var selectedTab = 1
    @State var offsetStateA: CGFloat = 0.0
    @State var offsetStateB: CGFloat = -65.0
    @State private var showView: Bool = true
    @State  var preTab: Int = 1
    @StateObject private var cardvm = VirtualCardVm()
    var floatCard: CGFloat = 0.0
    var body: some View {
        ZStack {
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
            .onChange(of: selectedTab) { newTab in
                // print("Tab \(newTab) was tapped")
                if newTab != 3 {
                    preTab = newTab
                }
                if(selectedTab == 3){
                    withAnimation(.spring()) {
                        showView = cardvm.value
                    }

                }
                
            }
            .overlay(alignment: .bottom) {
                CustomTab(tabSelection: $selectedTab)
                    .padding(.bottom, 30)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            if !showView {
                AddVirtualCard(
                    offsetA: $offsetStateA,
                    offsetB: $offsetStateB,
                    action: {
                        withAnimation(.spring().delay(0.3)) {
                            offsetStateA = 0.0
//                            offsetStateB = 25
                        }
                        withAnimation(.spring(response: 0.5)) {
                            selectedTab = preTab
                            showView = true
                        }
                   
                })
                .transition(.move(edge: .bottom))
            }
           
            
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(ChipViewModel())
    }
}
