//
//  LoginView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
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
            .environmentObject(AuthViewModel())
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
            CustomAuthTextField(placeholder: "Phone, email, or username", text: $vm.loginEmail)
            
            SecureAuthTextField(placeholder: "Password", text: $vm.loginPassword)
        }
    }
    private var loginButton: some View {
        VStack {
            Button {
                self.vm.login()
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
