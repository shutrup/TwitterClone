//
//  MainViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 30.06.2023.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var width = UIScreen.main.bounds.width - 80
    @Published var x = -UIScreen.main.bounds.width + 80
    @Published var showUserProfile: Bool = false
    
    @Published var selectedIndex = 0
    @Published var showCreateTweetView = false
    @Published var text = ""
    
    
    func onChangedGesture(value: DragGesture.Value) {
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
    func onEndedGesture() {
        withAnimation {
            if -x < width / 2 {
                x = 0
            } else {
                x = -width
            }
        }
    }
}
