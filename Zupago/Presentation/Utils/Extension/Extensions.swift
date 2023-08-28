//
//  Extensions.swift
//  Zupago
//
//  Created by Inyene Etoedia on 28/08/2023.
//

import Foundation
import SwiftUI


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.width
}

extension String{
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}
