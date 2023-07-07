//
//  FeedView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var vm = FeedViewModel()
    let user: User
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 18) {
                ForEach(vm.tweets, id: \.self) { tweet in
                    TweetCellView(vm: TweetCellViewModel(tweet: tweet))
                    
                    Divider()
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(user: User.mockUser)
    }
}
