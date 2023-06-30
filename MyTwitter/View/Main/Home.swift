//
//  Home.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var vm: MainViewModel
    
    var body: some View {
        VStack {
            ZStack {
                tabView
                
                createTweetButton
            }
            .sheet(isPresented: $vm.showCreateTweetView) {
                CreateTweetView(text: vm.text)
            }
        }
        .blur(radius: vm.x == 0 ? 5 : 0)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(MainViewModel())
    }
}


extension Home {
    private var createTweetButton: some View {
        VStack {
            Button {
                vm.showCreateTweetView.toggle()
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
                    withAnimation {
                        vm.x = -vm.width
                        vm.selectedIndex = 0
                    }
                }
                .navigationBarHidden(true)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            SearchView()
                .onTapGesture {
                    withAnimation {
                        vm.x = -vm.width
                        vm.selectedIndex = 1
                    }
                }
                .navigationBarHidden(true)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            NotificationView()
                .onTapGesture {
                    withAnimation {
                        vm.x = -vm.width
                        vm.selectedIndex = 2
                    }
                }
                .navigationBarHidden(true)
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
                .tag(2)
            
            MessageView()
                .onTapGesture {
                    withAnimation {
                        vm.x = -vm.width
                        vm.selectedIndex = 3
                    }
                }
                .navigationBarHidden(true)
                .tabItem {
                    Label("Message", systemImage: "paperplane.fill")
                }
                .tag(3)
        }
        .tint(Color("bg"))
    }
}
