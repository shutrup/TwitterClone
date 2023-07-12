//
//  User.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 05.07.2023.
//

import Foundation

struct APIResponse: Decodable {
    var user: User
    var token: String?
}

struct User: Decodable, Identifiable {
    var _id: String
    var id: String {
        return _id
    }
    var username: String
    var name: String
    var email: String
    var location: String?
    var bio: String?
    var website: String?
    var avatarExists: Bool?
    var followers: [String]?
    var followings: [String]?
    var isCurrentUser: Bool? = false
}

extension User {
    static var mockUser: User {
        User(_id: "1", username: "Shurup", name: "Shurup", email: "shurup@mail.ru", location: "fasdfasdfads", website: "fasdfasd" , followers: [], followings: [])
    }
}
