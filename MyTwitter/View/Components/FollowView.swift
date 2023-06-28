//
//  FollowView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 28.06.2023.
//

import SwiftUI

struct FollowView: View {
    var count: Int
    var title: String
    
    var body: some View {
        HStack  {
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView(count: 4, title: "LOX")
    }
}
