//
//  CustomProfileTextField.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 08.07.2023.
//

import SwiftUI

struct CustomProfileTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                
                TextField("", text: $text)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct CustomProfileTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomProfileTextField(text: .constant(""), placeholder: "Placeholder")
    }
}
