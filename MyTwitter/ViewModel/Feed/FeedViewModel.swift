//
//  FeedViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import SwiftUI

final class FeedViewModel: ObservableObject {
    @Published var tweets: [Tweet] = []
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.fetchTweets { result in
            switch result {
            case .success(let data):
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.tweets = tweets
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
