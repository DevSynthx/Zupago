//
//  TopView.swift
//  Zupago
//
//  Created by Inyene Etoedia on 31/08/2023.
//

import SwiftUI

struct TopView: View {
    @State private var index = 0
    @State private var isShow = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 70)
            HStack {
                Text("Hi, David")
                    .font(.custom(.medium, size: 20))
                    .foregroundColor(.white)
                Spacer()
                Image("chartIcon")
                      .resizable()
                      .frame(width: 20, height: 20)
                      .padding(.vertical, 6)
                      .padding(.horizontal, 6)
                      .background{
                          Rectangle()
                              .foregroundColor(.white.opacity(0.1))
                      }
                
                
              Image("notification")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 6)
                    .background{
                        Rectangle()
                            .foregroundColor(.white.opacity(0.1))
                    }
            }
            
            VStack {
                TabView(selection: $index) {
                    ForEach((0..<4), id: \.self) { index in
                        AmountCard(text: "Nigerian Naira")
                            .padding(.trailing, 5)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .frame(height: 120)
            
            HStack(spacing: 2) {
                ForEach((0..<4), id: \.self) { index in
                    if(index == self.index){
                        Rectangle()
                            .frame(width: 20)
                            .foregroundColor(.white)
                            .cornerRadius( 20)
                            .frame(width: 20, height: 7)
                      
                    } else{
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 20, height: 7)
                    }
                }
            }
            
            Spacer()
                .frame(height: 20)
            HStack {
                HStack {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(width: 10)
                    Text("Add")
                        .font(.custom(.regular, size: 16))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 50)
                .background{
                    RoundedRectangle(cornerRadius: 5, style: .continuous).fill()
                        .foregroundColor(.white.opacity(0.2))
                    
                }
                .overlay {
                    RoundedRectangle(
                        cornerRadius: 5,
                        style: .continuous
                    )
                    .stroke(.blue, lineWidth: 2)
            }
                Spacer()
                HStack {
                    Image("send")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(width: 10)
                    Text("Send")
                        .font(.custom(.regular, size: 16 ))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 50)
                .background{
                    RoundedRectangle(cornerRadius: 5, style: .continuous).fill()
                        .foregroundColor(.white.opacity(0.2))
                    
                }
                .overlay {
                    RoundedRectangle(
                        cornerRadius: 5,
                        style: .continuous
                    )
                    .stroke(.blue, lineWidth: 2)
            }
            }
            .padding(.bottom, 30)
        }
        .sheet(isPresented: $isShow, content: {
            Text("David")
            .presentationDetents([.medium, .large])        })
        .padding(.horizontal, 20)
        .background{
            Rectangle()
                .foregroundColor(AppColor.primary)
                .frame(maxWidth:.infinity)
                .cornerRadius(radius: 10, corners: [.bottomLeft, .bottomRight])
                .shadow(color: .black, radius: 5)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
