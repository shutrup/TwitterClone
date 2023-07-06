//
//  AuthViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 05.07.2023.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        
    }
    
    func register() {
        print(name, email, password)
        AuthServices.register(name: name, username: name, email: email, password: password) { result in
            switch result {
            case .success(let data):
                guard let data = try? JSONDecoder().decode(APIResponse.self, from: data as! Data) else {
                    return
                }
            case .failure:
                print("ERROR")
            }
        }
    }
    
    func logout() {
        
    }
}
