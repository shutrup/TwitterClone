//
//  WelcomView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            twitterLogo
            
            Spacer()
            
            Text ("See what's happening in the world right now.")
                .font(.system(size: 30, weight: .heavy, design: .default))
                .frame(width: getRect().width * 0.9, alignment: .center)
            
            Spacer()
            
            authButtons
            
            dividerOR
            
            createAccountButton
            
            privacy
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

extension WelcomeView {
    private var twitterLogo: some View {
        HStack(alignment: .center) {
            Image("twitter")
                .resizable()
                .scaledToFill()
                .padding(.trailing)
                .frame(width: 20, height: 20)
        }
    }
    private var authButtons: some View {
        VStack(alignment: .center, spacing: 10) {
            Button {
                
            } label: {
                AuthButton(imageName: "google", title: "Continue with Google")
            }
            
            Button {
                
            } label: {
                AuthButton(imageName: "apple", title: "Continue with Apple")
            }
        }
    }
    private var dividerOR: some View {
        HStack {
            Spacer()
            
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.3)
                .frame(width: getRect().width * 0.35, height: 1)
            
            Text("OR")
                .foregroundColor(.gray)
            
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.3)
                .frame(width: getRect().width * 0.35, height: 1)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    private var createAccountButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 36)
                .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                .frame(width: getRect().width - 60, height: 60, alignment: .center)
            .overlay(
                Text("Create account")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
            )
        }
        .padding(.bottom)
    }
    private var privacy: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("By signing up, you agree to our ")
                +
                Text ("Terms")
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                +
                Text(", ")
                +
                Text ("Privacy")
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                +
                Text(", ")
                +
                Text ("Policy")
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
                +
                Text(", ")
                +
                Text ("Cookie use")
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
            }
            .padding(.bottom)
            
            HStack(spacing: 2) {
                Text("Have an account already? ")
                +
                Text("Log in")
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
    }
}
