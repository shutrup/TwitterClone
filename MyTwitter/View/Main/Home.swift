//
//  Home.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct Home: View {
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    FeedView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(0)
                    
                    SearchView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .tag(1)
                    
                    NotificationView()
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "bell")
                        }
                        .tag(2)
                    
                    MessageView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "paperplane.fill")
                        }
                        .tag(3)
                }
                .tint(Color("bg"))
                
                VStack {
                    Button {
                        
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
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
