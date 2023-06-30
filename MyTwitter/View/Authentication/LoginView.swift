//
//  LoginView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack {
                NavBar {
                    dismiss()
                }
                
                title
                
                textFields
            }
            
            Spacer()
            
            loginButton
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    private var title: some View {
        Text ("To get started first enter your phone, email, or username")
            .font ( .title2)
            .fontWeight (.heavy)
            .multilineTextAlignment (.center)
            .padding (.horizontal)
            .padding (.top)
    }
    private var textFields: some View {
        Group {
            CustomAuthTextField(placeholder: "Phone, email, or username", text: $email)
            
            SecureAuthTextField(placeholder: "Password", text: $password)
        }
    }
    private var loginButton: some View {
        VStack {
            Button {
                
            } label: {
                Capsule()
                    .frame(width: 360, height: 40)
                    .foregroundColor(Color("bg"))
                    .overlay(
                        Text("Login")
                            .foregroundColor(.white)
                    )
            }
            .padding(.bottom, 4)
            
            Text("Forgot Password?")
                .foregroundColor(Color("bg"))
        }
    }
}
