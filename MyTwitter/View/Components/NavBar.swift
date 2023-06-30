//
//  NavBar.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

struct NavBar: View {
    var action: () -> ()
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    action()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding(.horizontal )
            
            Image("twitter")
                .resizable()
                .scaledToFill()
                .padding(.trailing)
                .frame(width: 20, height: 20)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(action: {})
    }
}
