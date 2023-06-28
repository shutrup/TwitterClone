//
//  MenuButton.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 28.06.2023.
//

import Foundation

struct MenuButtons: Hashable {
    var imageName: String
    var title: String
}

extension MenuButtons {
    static var fetchButtons: [MenuButtons] {
        [
        MenuButtons(imageName: "person", title: "Profile"),
        MenuButtons(imageName: "list.bullet.rectangle.portrait", title: "Lists"),
        MenuButtons(imageName: "ellipsis.message", title: "Topics"),
        MenuButtons(imageName: "bookmark", title: "Bookmarks"),
        MenuButtons(imageName: "bolt", title: "Moments")
        ]
    }
}


