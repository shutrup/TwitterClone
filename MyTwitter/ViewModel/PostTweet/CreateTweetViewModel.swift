//
//  CreateTweetViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import SwiftUI

final class CreateTweetViewModel: ObservableObject {
    
    func uploadTweet(text: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            print(result)
        }
    }
}
