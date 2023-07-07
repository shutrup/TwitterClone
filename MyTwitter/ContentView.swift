//
//  ContentView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        if vm.isAuthenticated {
//            if let user = vm.currentUser {
//                MainView(user: user)
//            }
            
            MainView()
        }
        else {
            WelcomeView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
