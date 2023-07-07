//
//  CreateTweetViewModel.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 07.07.2023.
//

import SwiftUI

final class CreateTweetViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var showImagePicker: Bool = false
    @Published var postImage: Image?
    @Published var width = UIScreen.main.bounds.width
    
    func uploadTweet(text: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { [weak self] result in
            if let image = self?.selectedImage {
                if let id = result?["_id"]! {
                    ImageUploader.uploadImage(paramName: "upload", fileName: "image1", image: image, urlPath: "/uploadTweetImage/\(id)")
                }
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
