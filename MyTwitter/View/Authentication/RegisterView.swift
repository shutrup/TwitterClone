//
//  RegisterView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm = AuthViewModel()
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            NavBar {
                dismiss()
            }
            
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top, 35)
            
            textFields
            
            Spacer()
            
            footer
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    private var textFields: some View {
        VStack(alignment: .leading, spacing: nil) {
            CustomAuthTextField(placeholder: "Name", text: $name)
            CustomAuthTextField(placeholder: "Phone number or Email", text: $email)
            SecureAuthTextField(placeholder: "Password", text: $password)
        }
    }
    private var footer: some View {
        VStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            Button {
                self.vm.register(reqBody: ["username": "shuruppppp", "name": name, "email": email, "password": "12345678"])
            } label: {
                Capsule()
                    .frame(width: 60, height: 30)
                    .foregroundColor(Color("bg"))
                    .overlay(
                        Text("Next")
                            .foregroundColor(.white)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 24)
        }
    }
}
