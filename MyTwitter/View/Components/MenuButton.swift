//
//  MenuButton.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 28.06.2023.
//

import SwiftUI

struct MenuButton: View {
    var imageName: String
    var title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
//                .imageScale(.large)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
        }
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu(vm: AuthViewModel.shared)
    }
}
