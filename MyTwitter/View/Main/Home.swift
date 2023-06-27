//
//  Home.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct Home: View {
    @State var selectedIndex = 0
    @State var showCreateTweetView = false
    @State var text = ""
    
    var body: some View {
        VStack {
            ZStack {
                tabView
                
                createTweetButton
            }
            .sheet(isPresented: $showCreateTweetView) {
                CreateTweetView(text: text)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension Home {
    private var createTweetButton: some View {
        VStack {
            Button {
                self.showCreateTweetView.toggle()
            } label: {
                Image("twitterPost")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color("bg"))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .padding(.bottom, 65)
        .padding(.trailing)
    }
    
    private var tabView: some View {
        TabView {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            SearchView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            NotificationView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
                .tag(2)
            
            MessageView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Label("Message", systemImage: "paperplane.fill")
                }
                .tag(3)
        }
        .tint(Color("bg"))
    }
}
