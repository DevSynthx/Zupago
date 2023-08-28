//
//  Fonts.swift
//  Zupago
//
//  Created by Inyene Etoedia on 27/08/2023.
//

import Foundation
import SwiftUI


//struct Font {
//static let regular = "Satoshi-Regular"
//static let medium = "Satoshi-Medium"
//static let light = "Satoshi-Light"
//static let bold = "Satoshi-Bold"
//}


enum FontType{
    case regular
    case medium
    case light
    case bold
}


extension FontType {
    var name: String {
        switch self {
        case .regular: return "Satoshi-Regular"
        case.light: return "Satoshi-Light"
        case.medium: return "Satoshi-Medium"
        case.bold: return "Satoshi-Bold"
            
        }
    }
}

extension Font {
    static func custom(_ font: FontType, size: CGFloat ) -> Font {
        return Font.custom(font.name, size: size)
    }
}
