//
//  ContentView.swift
//  Zupago
//
//  Created by Inyene Etoedia on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
    @StateObject var viewModel = ChipViewModel()
 
    var body: some View {
        VStack {
                
                VStack {
                    Spacer()
                        .frame(height: 70)
                    HStack {
                        Text("Hi, David")
                            .font(.custom(.medium, size: 25))
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
                                AmountCard()
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
                .padding(.horizontal, 20)
                .background{
                    Rectangle()
                        .foregroundColor(AppColor.primary)
                        .frame(maxWidth:.infinity)
                        .cornerRadius(radius: 10, corners: [.bottomLeft, .bottomRight])
                        .shadow(color: .black, radius: 5)
                }
            
      

            Spacer()
                .frame(height: 30)
            VStack(alignment: .leading, spacing: 30) {
                Text("Quick Actions")
                    .font(.custom(.regular, size: 17))
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 4){
                    ForEach(viewModel.rows, id:\.self){ rows in
                        HStack(spacing: 6){
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
        .frame(maxHeight:.infinity, alignment: .top)
        .edgesIgnoringSafeArea(.top)
        
    }
    
   //MARK: Checks if custom font was installed
   /*
    init(){
    for family in UIFont.familyNames {
    print(family)
    
    for names in UIFont.fontNames(forFamilyName: family){
    print("== \(names)")
    }
    }
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct AmountCard: View {
    
    var body: some View{
            VStack(alignment: .leading) {
                Text("Nigerian Naira")
                    .font(.custom(.regular, size: 13 ))
                    .foregroundColor(.white)
                HStack {
                    Text("N 329,000.00")
                        .font(.custom(.bold, size: 20))
                    .foregroundColor(.white)
                    Spacer()
                  Image(systemName: "eye")
                        .foregroundColor(.white)
                }

            }
            .frame(maxWidth: .infinity, alignment:.leading)
            .padding(.all, 15)
            .padding(.top, 20)
            .padding(.bottom, 10)
            .background{
                    RoundedRectangle(cornerRadius: 5, style: .continuous).fill()
                    .foregroundColor(.white.opacity(0.2))
                    .frame(maxWidth:.infinity)
                    .overlay {
                        Image("shape")
                            .resizable()
                            .frame(width: 330, height: 150)
                            .opacity(0.1)
                            .offset(x: 80, y: 65)
                    }
            }
            .clipped()
            .shadow(color: .black.opacity(0.2), radius: 4, x: -2, y: 5)
            .overlay {
                RoundedRectangle(
                       cornerRadius: 5,
                       style: .continuous
                   )
                .stroke(.blue, lineWidth: 2)
        }
        
    }
}


struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}



