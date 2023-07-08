//
//  EditProfileViwe.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 08.07.2023.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State var profileImage: Image?
    @State private var selectedImage: UIImage?
    @State var imagePickerPresented: Bool = false
    
    @State var name = ""
    @State var location = ""
    @State var bio = ""
    @State var website = ""
    
    var body: some View {
        VStack {
            ZStack {
                editButtons
                
                navTitle
            }
            
            VStack {
                bannerImage
                
                HStack {
                    profileImageAndImagePicker
                    
                    Spacer()
                }
                .padding(.top, -25)
                .padding(.bottom, -10)
                
                VStack {
                    customTextField(title: "Name", message: $name, placeholder: "Add your Name")
                    
                    customTextField(title: "Location", message: $location, placeholder: "Add your Location")
                    
                    customBioTextField
                    
                    customTextField(title: "Website", message: $website, placeholder: "Add your Website")
                }
            }
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

extension EditProfileView {
    private func loadImage() {
        guard let selectedImage = selectedImage else { return }
        self.profileImage = Image(uiImage: selectedImage)
    }
    private func customTextField(title: String, message: Binding<String>, placeholder: String) -> some View {
        VStack {
            Divider()
            
            HStack {
                ZStack {
                    HStack {
                        Text(title)
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    
                    CustomProfileTextField(text: message, placeholder: placeholder)
                        .padding(.leading, 90)
                }
            }
            .padding(.horizontal)
        }
    }
}

extension EditProfileView {
    private var editButtons: some View {
        HStack {
            Button {
                
            } label: {
                Text("Cancel")
                    .foregroundColor(.black)
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Save")
                    .foregroundColor(.black)
                
            }
        }
        .padding()
    }
    private var navTitle: some View {
        HStack {
            Spacer()
            
            Text("Edit Profile")
                .fontWeight(.heavy)
            
            Spacer()
        }
    }
    private var bannerImage: some View {
        Image("banner")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: getRect().width, height: 180, alignment: .center)
            .cornerRadius(0)
    }
    @ViewBuilder private var profileImageAndImagePicker: some View {
        if profileImage == nil {
            Button {
                self.imagePickerPresented.toggle()
            } label: {
                KFImage(URL(string: "http://localhost:3000/users/id/avatar"))
                    .resizable()
                    .placeholder {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                    .offset(y: -20)
                    .padding(.leading, 12)
            }
            .sheet(isPresented: $imagePickerPresented) {
                loadImage()
            } content: {
                ImagePicker(image: $selectedImage)
            }
        }
        else if let image = profileImage {
            VStack {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(y: -20)
                }
                .padding()
            }
            .padding(.leading, 12)
        }
    }
    private var customBioTextField: some View {
        VStack {
            Divider()
            
            HStack {
                ZStack(alignment: .topLeading) {
                    HStack {
                        Text("Bio")
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                        
                        Spacer()
                    }
                    
                    CustomProfileBioTextField(text: $bio)
                        .padding(.leading, 86)
                        .padding(.top, -6)
                }
                
               
            }
            .padding(.horizontal)
        }
    }
}
