//
//  MyTwitterApp.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

@main
struct MyTwitterApp: App {
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
