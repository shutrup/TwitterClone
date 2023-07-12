//
//  SlideMenu.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI
import Kingfisher

struct SlideMenu: View {
    @ObservedObject var vm: AuthViewModel
    
    @State var showFooter: Bool = false
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
            VStack {
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        NavigationLink {
                            UserProfile(user: vm.currentUser!)
                        } label: {
                            KFImage(URL(string: "http://localhost:3000/users/\(vm.currentUser!.id)/avatar"))
                                .placeholder {
                                    Image("logo")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                }
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                        
                        HStack(alignment: .top, spacing: 12) {
                            profileDescription
                            
                            Spacer()
                            
                            showFooterButton
                        }
                        
                        menuButtons
                        
                        createAccountsItems
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, edges?.top == 0 ? 15 : edges?.top)
                    .padding(.bottom, edges?.bottom == 0 ? 15 : edges?.bottom)
                    .frame(width: UIScreen.main.bounds.width - 85)
                    .background(Color.white)
                    .ignoresSafeArea(.all, edges: .vertical)
                    
                    Spacer(minLength: 0)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 85)
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu(vm: AuthViewModel.shared)
    }
}

extension SlideMenu {
    private var profileDescription: some View {
        VStack(alignment: .leading, spacing: 12) {
            NavigationLink {
                UserProfile(user: vm.currentUser!)
            } label: {
                Text("\(vm.currentUser?.name ?? "name") ")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.black)
            }
            
            Text("@\(vm.currentUser?.username ?? "username")")
                .foregroundColor(.gray)
            
            HStack(spacing: 20) {
                FollowView(count: 8, title: "Following")
                FollowView(count: 16, title: "Followers")
            }
            .padding(.top, 10)
            
            Divider()
                .padding(.top, 10)
        }
    }
    private var showFooterButton: some View {
        Button {
            withAnimation {
                self.showFooter.toggle()
            }
        } label: {
            Image(systemName: showFooter ? "chevron.down" : "chevron.up")
                .foregroundColor(Color("bg"))
        }
    }
    private var menuButtons: some View {
        VStack(alignment: .leading) {
            ForEach(MenuButtons.fetchButtons, id: \.self) { item in
                MenuButton(imageName: item.imageName, title: item.title)
            }
            
            Divider()
                .padding(.top)
            
            Button {
                
            } label: {
                MenuButton(imageName: "arrow.up.right.square", title: "Twitter Ads")
            }
            
            Divider()
            
            Button {
                
            } label: {
                Text("Settings and privacy")
                    .foregroundColor(.black)
            }
            .padding(.top, 20)
            
            Button {
                
            } label: {
                Text("Help centre")
                    .foregroundColor(.black)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            Divider()
                .padding(.bottom)
            
            footerButtons
        }
        .opacity(showFooter ? 0 : 1)
        .frame(height: showFooter ? 0 : nil)
    }
    private var footerButtons: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "bonjour")
                    .resizable()
                    .foregroundColor(Color("bg"))
                    .frame(width: 26, height: 26)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .foregroundColor(Color("bg"))
                    .frame(width: 26, height: 26)
            }
        }
    }
    private var createAccountsItems: some View {
        VStack(alignment: .leading) {
            Button {
                
            } label: {
                Text("Create a new account")
                    .foregroundColor(Color("bg"))
            }

            Button {
                
            } label: {
                Text("Add an existing account")
                    .foregroundColor(Color("bg"))
            }
            
            Spacer(minLength: 0)
        }
        .opacity(showFooter ? 1 : 0)
        .frame(height: showFooter ? nil : 0)
    }
}
