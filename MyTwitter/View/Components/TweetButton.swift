//
//  TweetButton.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct TweetButton: View {
    var imageName: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 17, height: 15)
                .bold()
        }
        .foregroundColor(.gray)
    }
}

struct TweetButton_Previews: PreviewProvider {
    static var previews: some View {
        TweetButton(imageName: "heart", action: {})
    }
}
