//
//  MainView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct MainView: View {
    @State var width = UIScreen.main.bounds.width - 80
    @State var x = -UIScreen.main.bounds.width + 80
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    VStack {
                        TopBar(x: $x)
                        
                        Home()
                    }
                    
                    SlideMenu()
                        .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
                        .offset(x: x)
                        .background(Color.black.opacity(x == 0 ? 0.5 : 0))
                        .ignoresSafeArea(.all, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                x = -width
                            }
                        }
                }
                .gesture(DragGesture().onChanged({ value in
                    onChangedGesture(value: value)
                }).onEnded({ _ in
                    onEndedGesture()
                }))
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    private func onChangedGesture(value: DragGesture.Value) {
        withAnimation {
            if value.translation.width > 0 {
                if x < 0 {
                    x = -width + value.translation.width
                }
            } else {
                if x != -width {
                    x = value.translation.width
                }
            }
        }
    }
    private func onEndedGesture() {
        withAnimation {
            if -x < width / 2 {
                x = 0
            } else {
                x = -width
            }
        }
    }
}
