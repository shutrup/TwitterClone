//
//  SearchCellView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 27.06.2023.
//

import SwiftUI

struct SearchCellView: View {
    
    var tag = ""
    var tweets = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("hello")
                .fontWeight(.heavy)
            
            Text(tweets + " Tweets")
                .fontWeight(.light)
        }
    }
}

struct SearchCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCellView()
    }
}
