//
//  CustomKeyboard.swift
//  Zupago
//
//  Created by Inyene Etoedia on 18/09/2023.
//

import SwiftUI

struct PINCodeView: View {
    @State var pinCode: String = ""
    @State var pinCodeCount: [String] = []
    @Environment(\.presentationMode) var present
    let maxDigits = 4
    
    let keypadRows: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["touchid", "0", "Delete"]
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack (spacing: 10) {
                    Text("Enter your Master Pin")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                      
                    Text("Enter your master pin to authorize this transaction")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            Image(systemName: "xmark")
                    .font(.system(size: 15))
                    .padding(5)
                    .background(AppColor.primary.opacity(0.1))
                    .onTapGesture {
                        present.wrappedValue.dismiss()
                    }
        
            }
            
            
            HStack(spacing: 15) {
                ForEach(0..<maxDigits, id: \.self) { index in
                    Text(pinCode.count > index ? "•" : "")
                        .font(.title)
                        .frame(width: 50, height: 60)
                        .frame(maxWidth: .infinity)
                        .background{
                            RoundedRectangle(cornerRadius: 3)
                                .fill(AppColor.primary.opacity(0.04))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(pinCode.count > index ? AppColor.primary :  .gray.opacity(0.5) ,lineWidth: 0.7)
                                }
                            
                        }
                        .frame(maxWidth: .infinity)
                    
                }
            }
            .padding(.bottom, 30)
            
            ForEach(keypadRows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { key in
                        Button(
                            action: {
                                if key == "Delete" {
                                    if !pinCode.isEmpty {
                                        pinCode = String(pinCode.dropLast())
                                    }
                                }
                                else if pinCode.count < maxDigits {
                                    pinCode.append(key)
                                    
                                    if pinCode.count == maxDigits {
                                        present.wrappedValue.dismiss()
                                    }
                                }
                           
                        }) {
                            
                            if key == "Delete" {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke( .gray.opacity(0.5) ,lineWidth: 0.5)
                                    })
                            }
                            
                            else if(key == "touchid"){
                                Image(systemName: "touchid")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke( .gray.opacity(0.5) ,lineWidth: 0.5)
                                    })
                            }
                            
                            
                            else {
                                
                                Text(key)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke( .gray.opacity(0.5) ,lineWidth: 0.5)
                                    })
                                  
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .padding(.horizontal, 30)
     
    }
}

struct PINCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PINCodeView()
    }
}



struct CustomKeypadView: View {
    @Binding var text: String
    
    let keypadRows: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["", "0", "Delete"]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(keypadRows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { key in
                        Button(action: {
                            if key == "Delete" {
                                text = String(text.dropLast())
                            } else {
                                text += key
                            }
                        }) {
                            if key == "Delete" {
                                Image(systemName: "delete.left")
                                    .font(.system(size: 24))
                                    .foregroundColor(.red)
                            } else {
                                Text(key)
                                    .font(.system(size: 24))
                                    .frame(width: 60, height: 60)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}



