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
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    
    init() {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: "jsonwebtoken")

        if token != nil {
            self.isAuthenticated = true

            if let userId = defaults.object(forKey: "userid") {
                fetchUser(userId: userId as! String)
                print("fetched user")
            }
        } else {
            self.isAuthenticated = false
        }
    }
    
    static let shared = AuthViewModel()
    
    func login() {
        let defaults = UserDefaults.standard
        
        AuthServices.login(email: loginEmail, password: loginPassword) { [weak self] result in
            switch result {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(APIResponse.self, from: data as! Data) else { return }
                
                DispatchQueue.main.async {
                    defaults.set(user.token, forKey: "jsonwebtoken")
                    defaults.set(user.user.id, forKey: "userid")
                    self?.isAuthenticated = true
                    self?.currentUser = user.user
                }
                
            case .failure:
                print("ERROR")
            }
        }
    }
    
    func register() {
        AuthServices.register(name: name, username: name, email: email, password: password) { result in
            switch result {
            case .success(let data):
                guard let data = try? JSONDecoder().decode(APIResponse.self, from: data as! Data) else { return }
            case .failure:
                print("ERROR")
            }
        }
    }
    
    func fetchUser(userId: String) {
        AuthServices.fetchUser(id: userId) { [weak self] result in
            switch result {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return }
                
                DispatchQueue.main.async {
                    UserDefaults.standard.setValue(user.id, forKey: "userid")
                    self?.isAuthenticated = true
                    self?.currentUser = user
                    print(user)
                }
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func logout() {
        
    }
}
