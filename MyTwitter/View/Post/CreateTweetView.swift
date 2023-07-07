//
//  CreateTweetView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct CreateTweetView: View {
    @ObservedObject var vm = CreateTweetViewModel()
    @State var text: String
    @Binding var showCreateTweetView: Bool
    
    var body: some View {
        VStack {
            headerButtons
            
            MultilineTextField(text: $text)
        }
        .padding()
    }
}

struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView(text: "", showCreateTweetView: .constant(false))
    }
}

extension CreateTweetView {
    private var headerButtons: some View {
        HStack {
            Button {
                showCreateTweetView.toggle()
            } label: {
                Text("Cancel")
            }
            
            Spacer()

            Button {
                if !text.isEmpty {
                    vm.uploadTweet(text: text)
                }
                
                showCreateTweetView.toggle()
            } label: {
                Text("Tweet")
                    .padding()
            }
            .background(Color("bg"))
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}
