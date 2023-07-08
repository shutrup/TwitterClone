//
//  EditProfileViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 08.07.2023.
//

import SwiftUI

final class EditProfileViewModel: ObservableObject {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func save(name: String?, bio: String?, location: String?, website: String?) {
        guard let userNewName = name else { return }
        guard let userNewBio = bio else { return }
        guard let userNewLocation = location else { return }
        guard let userNewWebsite = website else { return }
        
        self.user.name = userNewName
        self.user.bio = userNewBio
        self.user.location = userNewLocation
        self.user.website = userNewWebsite
    }
}
