//
//  CustomAuthTextField.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct CustomAuthTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .opacity(text.isEmpty ? 1 : 0)
                
                
                TextField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                
            }
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor (.gray)
                .padding(.top, -2)
        }
        .padding(.horizontal)
    }
}

struct CustomAuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomAuthTextField(placeholder: "write text", text: .constant(""))
    }
}
