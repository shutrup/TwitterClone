//
//  AuthButton.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct AuthButton: View {
    var imageName: String
    var title: String
    
    var body: some View {
        HStack(spacing: -4) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Text(title)
                .fontWeight(.bold)
                .font(.title3)
                .foregroundColor(.black)
                .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 36)
                .stroke(Color.black, lineWidth: 1)
                .opacity(0.3)
                .frame(width: getRect().width - 60, height: 60)
        )
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(imageName: "google", title: "Continue with Google")
    }
}
