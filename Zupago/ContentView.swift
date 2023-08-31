//
//  ContentView.swift
//  Zupago
//
//  Created by Inyene Etoedia on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
 
    var body: some View {
        VStack {
               TopView()
            Spacer()
                .frame(height: 25)
            QuickAction()
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
            .environmentObject(ChipViewModel())
    }
}



struct AmountCard: View {
    @State var toggle: Bool = false
    
    @State var text: String
    
    var body: some View{
            VStack(alignment: .leading) {
                Text(text)
                    .font(.custom(.regular, size: 13 ))
                    .foregroundColor(.white)
                HStack {
                    Text(toggle == false ? "N 329,000.00" : "********")
                        .font(.custom(.bold, size: 20))
                    .foregroundColor(.white)
                    Spacer()
                    Image(systemName: toggle == false ? "eye" : "eye.slash")
                        .foregroundColor(.white)
                        .onTapGesture {
                            toggle.toggle()
                        }
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



