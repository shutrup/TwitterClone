//
//  MessageView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<20, id: \.self) { noty in
                    MessageCellView()
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
