//
//  SearchView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var text: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
            SearchBar(text: $text, isEditing: $isEditing)
                .padding(.horizontal)
            
            if !isEditing {
                List(0..<20) { tweet in
                    SearchCellView(tag: "hello", tweets: String(tweet))
                }
                .listStyle(.inset)
            } else {
                List(0..<9) { tweet in
                    SearchUserCellView()
                }
                .listStyle(.inset)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
