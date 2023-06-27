//
//  NotificationView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<20, id: \.self) { noty in
                    NotificationCellView()
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
