//
//  QuickAction.swift
//  Zupago
//
//  Created by Inyene Etoedia on 31/08/2023.
//

import SwiftUI

struct QuickAction: View {
    @EnvironmentObject var viewModel : ChipViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Quick Actions")
                .font(.custom(.regular, size: 17))
                .foregroundColor(.black)
            
            Spacer()
                .frame(height: 15)
            VStack(alignment: .leading, spacing: 4){
                ForEach(viewModel.rows, id:\.self){ rows in
                    HStack(spacing: 15){
                        ForEach(rows){ row in
                            ChipView(label: row.name, image: row.image, action: {})
                        }
                    }
                    .frame(height: 35)
                    .padding(.bottom, 30)
                }
            }
            
            HStack(spacing: 10){
                Image("fingerprint")
                    .padding(6)
                    .background{
                        Rectangle()
                            .foregroundColor(AppColor.primary)
                         
                    }
            
                VStack(alignment:.leading, spacing: 7) {
                    Text("Enable biometrics")
                        .font(.custom(.regular, size: 17))
                    .foregroundColor(.black)
                    Text("Authorize transactions and unlock apps")
                        .font(.custom(.regular, size: 12))
                    .foregroundColor(.black)
                }
                Spacer()
                Image(systemName: "xmark")
                    .padding(6)
                   
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(.black.opacity(0.2), lineWidth: 1)
            }
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct QuickAction_Previews: PreviewProvider {
    static var previews: some View {
        QuickAction()
            .environmentObject(ChipViewModel())
    }
}
