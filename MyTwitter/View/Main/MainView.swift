//
//  MainView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel()
    let user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    VStack {
                        TopBar(x: $vm.x)
                        
                        Home(user: user)
                            .environmentObject(vm)
                    }
                    .offset(x: vm.x + vm.width)
                    
                    SlideMenu(vm: AuthViewModel.shared)
                        .shadow(color: Color.black.opacity(vm.x != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
                        .offset(x: vm.x)
                        .ignoresSafeArea(.all, edges: .vertical)
                }
                .gesture(DragGesture().onChanged({ value in
                    vm.onChangedGesture(value: value)
                }).onEnded({ _ in
                    vm.onEndedGesture()
                }))
            }
            .onDisappear {
                vm.x = -vm.width
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(user: User.mockUser)
    }
}
