//
//  CreateTweetView.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 26.06.2023.
//

import SwiftUI

struct CreateTweetView: View {
    @ObservedObject var vm = CreateTweetViewModel()
    @State var text: String
    @Binding var showCreateTweetView: Bool
    
    var body: some View {
        VStack {
            headerButtons
            
            MultilineTextField(text: $text)
            
            postImage
        }
        .padding()
    }
}

struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView(text: "", showCreateTweetView: .constant(false))
    }
}

extension CreateTweetView {
    private var headerButtons: some View {
        HStack {
            Button {
                showCreateTweetView.toggle()
            } label: {
                Text("Cancel")
            }
            
            Spacer()

            Button {
                if !text.isEmpty {
                    vm.uploadTweet(text: text)
                }
                
                showCreateTweetView.toggle()
            } label: {
                Text("Tweet")
                    .padding()
            }
            .background(Color("bg"))
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    private var showImagePickerButton: some View {
        Button {
            self.vm.showImagePicker.toggle()
        } label: {
            Image(systemName: "plus.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipped()
                .padding(.top)
                .foregroundColor(Color("bg"))
        }
        .sheet(isPresented: $vm.showImagePicker, onDismiss: {
            vm.loadImage()
        }, content: {
            ImagePicker(image: $vm.selectedImage)
        })
    }
    @ViewBuilder private var postImage: some View {
        if vm.postImage == nil {
            showImagePickerButton
        } else if let image = vm.postImage {
            VStack {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .padding(.horizontal)
                        .frame(width: vm.width * 0.9)
                        .cornerRadius(16)
                        .clipped()
                }
                
                Spacer()
            }
        }
    }
}
