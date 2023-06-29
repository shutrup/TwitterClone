//
//  UserProfile.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 29.06.2023.
//

import SwiftUI

struct UserProfile: View {
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var currentTab: String = "Tweets"
    @Namespace var anime
    @State var tabButtonOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                stickyHeader
                
                VStack {
                    HStack {
                        userLogo
                        
                        Spacer()
                        
                        editButton
                    }
                    .padding(.top, -25)
                    .padding(.bottom, -10)
                    
                    userDescription
                    
                    tabButtons
                    
                    tweetList
                }
                .padding(.horizontal)
                .zIndex(-offset > 80 ? 0 : 1)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

//MARK: PRIVATE FUNC USERPROFILE VIEW
extension UserProfile {
    private func blueViewOpacity() -> Double {
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
    private func getTitleOffset() -> CGFloat {
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        
        return offset
    }
    private func getOffset() -> CGFloat {
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    private func getScaleForLogo() -> CGFloat {
        let progress = (-offset / 80)
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
}

//MARK: PRIVATE PROPERTY VIEW
extension UserProfile {
    private var stickyHeader: some View {
        GeometryReader { proxy -> AnyView in
            let minY = proxy.frame(in: .global).minY
            
            DispatchQueue.main.async {
                self.offset = minY
            }
            
            return AnyView(
                ZStack {
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getRect().width, height: minY > 0 ? 180 + minY : 180, alignment: .center)
                        .cornerRadius(0)
                    
                    BlurView()
                        .opacity(blueViewOpacity())
                    
                    VStack(spacing: 5) {
                        Text("Serega")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("150 tweets")
                            .foregroundColor(.white)
                    }
                    .offset(y: 120)
                    .offset(y: titleOffset > 100 ? 0 : -getTitleOffset())
                    .opacity(titleOffset < 100 ? 1 : 0)
                }
                    .clipped()
                    .frame(height: minY > 0 ? 180 + minY : nil)
                    .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
            )
            
        }
        .frame(height: 180)
        .zIndex(1)
    }
    private var userLogo: some View {
        Image("logo")
            .resizable()
            .scaledToFill()
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .padding(8)
            .background(
                Color.white
                    .clipShape(Circle())
            )
            .offset(y: offset < 0 ? getOffset() - 20 : -20)
            .scaleEffect(getScaleForLogo())
    }
    private var editButton: some View {
        Button {
            
        } label: {
            Text("Edit Profile")
                .foregroundColor(.blue)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.5)
                )
        }
    }
    private var userDescription: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Serega")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
            
            Text("@serega_pirat")
                .foregroundColor(.gray)
            
            Text("I don't know what I don't know. Items So, I try to figure out what don't know. Founder!")
            
            HStack(spacing: 16) {
                FollowView(count: 13, title: "Followers")
                
                FollowView(count: 680, title: "Following")
            }
        }
        .overlay (
            GeometryReader { proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                
                DispatchQueue.main.async {
                    self.titleOffset = minY
                }
                
                return Color.clear
            }
            .frame(width: 0, height: 0), alignment: .top
        )
    }
    private var tabButtons: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                HStack(spacing: 0) {
                    TabButton(title: "Tweets", currentTab: $currentTab, anime: anime)
                    TabButton(title: "Tweets & Likes", currentTab: $currentTab, anime: anime)
                    TabButton(title: "Media", currentTab: $currentTab, anime: anime)
                    TabButton(title: "Likes", currentTab: $currentTab, anime: anime)
                }
            }
            
            Divider()
        }
        .padding(.top, 30)
        .background(Color.white)
        .offset(y: tabButtonOffset < 90 ? -tabButtonOffset + 90 : 0)
        .overlay (
            GeometryReader { proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                
                DispatchQueue.main.async {
                    self.tabButtonOffset = minY
                }
                
                return Color.clear
            }
                .frame(width: 0, height: 0), alignment: .top
        )
        .zIndex(1)
    }
    private var tweetList: some View {
        VStack(spacing: 18) {
            TweetCellView(tweet: "Hey Tim, are those regular glasses?", tweetImage: "banner")
            
            Divider()
            
            ForEach(1..<5, id: \.self) { tweet in
                TweetCellView(tweet: "Hey Tim, are those regular glasses?")
                
                Divider()
            }
        }
        .padding(.top)
        .zIndex(0)
    }
}
