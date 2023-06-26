//
//  CreateTweetView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct CreateTweetView: View {
    @State var text: String
    
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
        CreateTweetView(text: "")
    }
}

extension CreateTweetView {
    private var headerButtons: some View {
        HStack {
            Button {
                
            } label: {
                Text("Cancel")
            }
            
            Spacer()

            Button {
                
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
