//
//  UserProfile.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 29.06.2023.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
    @ObservedObject var vm: ProfileViewModel
    var user: User
    
    init(user: User) {
        self.user = user
        self.vm = ProfileViewModel(user: user)
    }
    
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var currentTab: String = "Tweets"
    @Namespace var anime
    @State var tabButtonOffset: CGFloat = 0
    @State var showEditView: Bool = false
    @Environment(\.dismiss) var dismiss
    
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
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(user: User.mockUser)
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
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .zIndex(1)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .imageScale(.large)
                        .bold()
                        .padding(.leading, 25)
                        .padding(.top, 45)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getRect().width, height: minY > 0 ? 180 + minY : 180, alignment: .center)
                        .cornerRadius(0)
                    
                    BlurView()
                        .opacity(blueViewOpacity())
                    
                    VStack(spacing: 5) {
                        Text(user.username)
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
        KFImage(URL(string: "http://localhost:3000/users/\(vm.user.id)/avatar"))
            .placeholder({
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
            })
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
            self.showEditView.toggle()
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
        .sheet(isPresented: $showEditView) {
            EditProfileView(user: $vm.user)
        }
    }
    private var userDescription: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(vm.user.username)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                
                Text("@\(vm.user.username)")
                    .foregroundColor(.gray)
                
                Text(vm.user.bio ?? "I don't know what I don't know. Items So, I try to figure out what don't know. Founder!")
                
                HStack(spacing: 8) {
                    if let userLocation = vm.user.location {
                        if (userLocation != "") {
                            HStack(spacing: 2) {
                                Image(systemName: "mappin.circle.fill")
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.gray)
                                    
                                Text(userLocation)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                        }
                    }
                    
                    if let userWebsite = vm.user.website {
                        if (userWebsite != "") {
                            HStack(spacing: 2) {
                                Image(systemName: "link")
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.gray)
                                    
                                Text(userWebsite)
                                    .foregroundColor(Color("bg"))
                                    .font(.system(size: 14))
                            }
                        }
                    }
                }
                
                HStack(spacing: 16) {
                    FollowView(count: vm.user.followers?.count ?? 0, title: "Followers")
                    
                    FollowView(count: vm.user.followings?.count ?? 0, title: "Following")
                }
            }
            .padding(.leading, 8)
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
            
            Spacer()
        }
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
            ForEach(vm.tweets, id: \.self) { tweet in
                TweetCellView(vm: TweetCellViewModel(tweet: tweet))
                
                Divider()
            }
        }
        .padding(.top)
        .zIndex(0)
    }
}
