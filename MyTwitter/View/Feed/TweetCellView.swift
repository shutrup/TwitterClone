//
//  TweetCellView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    @ObservedObject var vm: TweetCellViewModel
    
    init(vm: TweetCellViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                logo
                
                VStack(alignment: .leading, spacing: 10) {
                    userName
                    
                    Text(vm.tweet.text)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    userTweetImage
                }
                
                Spacer()
            }
            
            tweetButtons
        }
    }
}

struct TweetCellView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellView(vm: TweetCellViewModel(tweet: Tweet(_id: "", text: "", userId: "", username: "", user: "", image: "")))
    }
}

extension TweetCellView {
    private var logo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 55, height: 55)
            .clipShape(Circle())
    }
    private var userName: some View {
        Text("\(vm.tweet.username) ")
            .fontWeight(.bold)
            .foregroundColor(.primary)
        +
        Text("@\(vm.tweet.username)")
            .foregroundColor(.gray)
    }
    @ViewBuilder private var userTweetImage: some View {
        if let imageId = vm.tweet.id {
            if vm.tweet.image == "true" {
                GeometryReader { proxy in
                    KFImage(URL(string: "http://localhost:3000/tweets/\(imageId)/image"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.frame(in: .global).width, height: 250)
                        .cornerRadius(15)
                }
                .frame(height: 250)
            }
        }
    }
    private var tweetButtons: some View {
        HStack(spacing: 50) {
            TweetButton(imageName: "message") {
                
            }
            
            TweetButton(imageName: "arrow.2.squarepath") {
                
            }
            
            TweetButton(imageName: "heart.fill") {
                
            }
            
            TweetButton(imageName: "icloud.and.arrow.up") {
                
            }
        }
        .padding(.top, 4)
    }
}

var sampleText = "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum"
