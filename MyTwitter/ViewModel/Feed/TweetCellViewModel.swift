//
//  TweetCellViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import SwiftUI

final class TweetCellViewModel: ObservableObject {
    @Published var tweet: Tweet
    @Published var user: User?
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.fetchUser(userId: tweet.userId)
    }
    
    func fetchUser(userId: String) {
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        
        AuthServices.fetchUser(id: userId) { result in
            switch result {
            case .success(let success):
                guard let user = try? JSONDecoder().decode(User.self, from: success as! Data) else { return }
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
