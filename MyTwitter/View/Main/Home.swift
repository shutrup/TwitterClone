//
//  Home.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    FeedView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                    
                    NotificationView()
                        .tabItem {
                            Image(systemName: "bell")
                        }
                    
                    MessageView()
                        .tabItem {
                            Image(systemName: "paperplane.fill")
                        }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
