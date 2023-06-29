//
//  TabButton.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 29.06.2023.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var currentTab: String
    var anime: Namespace.ID
    
    var body: some View {
        Button {
            
        } label: {
            LazyVStack(spacing: 12) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(currentTab == title ? .blue : .gray)
                    .padding(.horizontal)
                
                if currentTab == title {
                    Capsule()
                        .fill(.blue)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: anime)
                } else {
                    Capsule()
                        .fill(.clear)
                        .frame(height: 1.2)
                }
            }
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
