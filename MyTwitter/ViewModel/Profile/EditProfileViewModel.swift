//
//  EditProfileViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 08.07.2023.
//

import SwiftUI

final class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete: Bool = false
    
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
    
    func uploadUserData(name: String?, bio: String?, location: String?, website: String?) {
        let userID = user.id
        let urlPath = "/users/\(userID)"
        let url = URL(string: "http://localhost:3000\(urlPath)")!
        
        AuthServices.makePathRequestWithAuth(urlString: url, reqBody: ["name": name, "bio": bio, "location": location, "website": website]) { [weak self] result in
            DispatchQueue.main.async {
                self?.save(name: name, bio: bio, location: location, website: website)
                self?.uploadComplete.toggle()
            }
        }
    }
}
