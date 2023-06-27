//
//  TweetCellView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct TweetCellView: View {
    var tweet: String
    var tweetImage: String?
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                logo
                
                VStack(alignment: .leading, spacing: 10) {
                    userName
                    
                    Text(tweet)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if let image = tweetImage {
                        userTweetImage(tweetImage: image)
                            .frame(height: 250)
                    }
                }
            }
            
            tweetButtons
        }
    }
}

struct TweetCellView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellView(tweet: sampleText, tweetImage: "logo")
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
        Text("Serega Pirat ")
            .fontWeight(.bold)
            .foregroundColor(.primary)
        +
        Text("@serega_pirat")
            .foregroundColor(.gray)
    }
    private func userTweetImage(tweetImage: String) -> some View {
        GeometryReader { proxy in
            Image(tweetImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.frame(in: .global).width, height: 250)
                .cornerRadius(15)
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
