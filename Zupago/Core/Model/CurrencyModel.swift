//
//  CurrencyModel.swift
//  Zupago
//
//  Created by Inyene Etoedia on 19/09/2023.
//

import Foundation


struct Currency: Identifiable {
    var id = UUID().uuidString
    let name: String
    let sign: String
    let logo: String
    let details: String
    
}




var currencies : [Currency] = [
    Currency(name: "Nigerian Naira", sign: "NGN", logo: "ng", details: "Available Balance: N329,000"),
    Currency(name: "Us Dollar", sign: "USD", logo: "us", details: "Available Balance: $329,000"),
    Currency(name: "Great Britain Pounds", sign: "POUND", logo: "uk", details: "Available Balance: £329,000"),
    Currency(name: "European Euro", sign: "EURO", logo: "euro", details: "Available Balance: €329,000"),
]

extension Currency {
    static func placeHolder() -> Currency {
        Currency(name: "Nigerian Naira", sign: "NGN", logo: "ng", details: "Available Balance: N329,000")
    }
}

 
