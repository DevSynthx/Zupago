//
//  ChipView.swift
//  Zupago
//
//  Created by Inyene Etoedia on 28/08/2023.
//

import SwiftUI

struct ChipView: View {
    var label: String
    var image: String
    var action: () -> Void
    
    var body: some View {
        Text(label)
            .font(.system(size: 13))
            .padding(.trailing, 20)
            .padding(.leading, 43)
            .padding(.vertical, 17)
            .background(
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(AppColor.primary.opacity(0.1))
                    Image(image)
                        .frame(width: 15, height: 15)
                        .padding(.leading, 15)
                }
            )
            .overlay {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(.black.opacity(0.1), lineWidth: 1)
            }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(label: "Water melon way", image: "router", action: {})
    }
}
