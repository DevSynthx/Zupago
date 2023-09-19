//
//  AddVirtualCard.swift
//  Zupago
//
//  Created by Inyene Etoedia on 12/09/2023.
//

import SwiftUI

struct AddVirtualCard: View {
    let screenW = UIScreen.main.bounds.size.width
    @Binding var offsetA: CGFloat
    @Binding var offsetB: CGFloat
    let action: () -> Void
    
    
    var body: some View {
        VStack(alignment:.center ){
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 15, height: 15)
                .padding(10)
                .background{
                    Rectangle()
                        .foregroundColor(AppColor.primary.opacity(0.1))
                }
                .onTapGesture(perform: action)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 100)
            ZStack {
                Image("cardB")
                    .resizable()
                    .frame(width: 350, height: 200)
                    .offset(x: -20, y: offsetB)

                Image("cardA")
                    .resizable()
                    .frame(width: 350, height: 200)
                    .offset(y: offsetA)
            }
            
            VStack(alignment:.leading) {
                Text("Introducing")
                    .font(.custom(.light, size: 14))
                    .foregroundColor(.black.opacity(0.5))
                
                Text("Zupago Virtual Cards")
                    .font(.custom(.bold, size: 30))
            }
            Spacer()
                .frame(height: 40)
            HStack (spacing: 20){
                Image("world")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(12)
                    .background{
                        Rectangle()
                            .foregroundColor(AppColor.primary.opacity(0.1))
                    }
                
                VStack(alignment:.leading, spacing: 5) {
                    Text("Spend worldwide")
                        .font(.custom(.light, size: 14))
                    
                    Text("Shop online and pay with the zupago card worldwide")
                        .font(.custom(.light, size: 11))
                        .foregroundColor(.black.opacity(0.5))
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 20)
            HStack (spacing: 20){
                Image("vcard")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(12)
                    .background{
                        Rectangle()
                            .foregroundColor(AppColor.primary.opacity(0.1))
                    }
                
                VStack(alignment:.leading, spacing: 5) {
                    Text("Create Virtual Cards")
                        .font(.custom(.light, size: 14))
                    
                    Text("Shop online and pay with the zupago card worldwide")
                        .font(.custom(.light, size: 11))
                        .foregroundColor(.black.opacity(0.5))
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                //  .frame(height: 20)
            Button {
                
            } label: {
                Text("Get Started")
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity )
            .padding()
            .background(AppColor.primary)
            .padding(.horizontal, 0)
            .cornerRadius(5)
        
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.white)
        
    }
}

struct AddVirtualCard_Previews: PreviewProvider {
    static var previews: some View {
        AddVirtualCard(
            offsetA: .constant(0.0),
            offsetB: .constant(-65.0),
            action: {}
        
        )
    }
}
