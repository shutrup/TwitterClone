//
//  Tweet.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import SwiftUI

struct Tweet: Identifiable, Decodable {
    let _id: String
    var id: String {
        return _id
    }
    let text: String
    let userId: String
    let username: String
    let user: String
}
