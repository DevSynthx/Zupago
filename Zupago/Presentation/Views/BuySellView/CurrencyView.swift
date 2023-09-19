//
//  CurrencyView.swift
//  Zupago
//
//  Created by Inyene Etoedia on 19/09/2023.
//

import SwiftUI

struct CurrencyView: View {
    @Binding var selected : (image: String, sign: String)
    let currencies: Currency
    let action: ()-> Void
    var body: some View {
      
        HStack(spacing: 20) {
            Spacer()
                .frame(width: 5)
            Image(currencies.logo)
                .font(.system(size: 15))
                .padding(5)
                .background(AppColor.primary.opacity(0.1))

            Text(currencies.name)
                .padding()

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            Rectangle()
                .foregroundColor(
                   
                    .gray.opacity(0.1))
        }
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke( selected.sign == currencies.sign ? AppColor.primary : .gray.opacity(0.04), lineWidth: 0.5)
        }
        .padding(.vertical, 5)
        .onTapGesture(perform: action)
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(
            selected: .constant(("ng", "NGN")),
            currencies: .placeHolder(), action: {})
    }
}
