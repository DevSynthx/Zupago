//
//  MainRoute.swift
//  Zupago
//
//  Created by Inyene Etoedia on 18/09/2023.
//

import SwiftUI

struct MainRoute: View {
    @ObservedObject
    var router = Router<Routes>(root: .MainScreen)
    var body: some View {
        RouteView(router: router) { routes in
            
            switch routes {
            case .MainScreen: MainScreen()
            case .BuySell: BuyAndSell()
            }
            
        }
    }
}

struct MainRoute_Previews: PreviewProvider {
    static var previews: some View {
        MainRoute()
            .environmentObject(ChipViewModel())
            .environmentObject(Router(root: Routes.MainScreen))
    }
}
