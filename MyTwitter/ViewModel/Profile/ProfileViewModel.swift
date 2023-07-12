//
//  ProfileViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 08.07.2023.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var tweets: [Tweet] = []
    
    init(user: User) {
        self.user = user
        fetchTweet()
        checkCurrentUser()
    }
    
    func fetchTweet() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(user.id)"
        
        RequestServices.fetchTweets { result in
            switch result {
            case .success(let success):
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from: success as! Data) else { return }
                DispatchQueue.main.async {
                    self.tweets = tweets
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func checkCurrentUser() {
        if (self.user._id == AuthViewModel.shared.currentUser?._id) {
            self.user.isCurrentUser = true
        }
    }
}
