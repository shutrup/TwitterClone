//
//  EditProfileViwe.swift
//  MyTwitter
//
//  Created by Шарап Бамматов on 08.07.2023.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @Binding var user: User
    @ObservedObject var vm: EditProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var profileImage: Image?
    @State private var selectedImage: UIImage?
    @State var imagePickerPresented: Bool = false
    
    @State var name: String
    @State var location: String
    @State var bio: String
    @State var website: String
    
    init(user: Binding<User>) {
        self._user = user
        self.vm = EditProfileViewModel(user: self._user.wrappedValue)
        self._name = State(wrappedValue: self._user.name.wrappedValue)
        self._bio = State(wrappedValue: self._user.bio.wrappedValue ?? "")
        self._location = State(wrappedValue: self._user.location.wrappedValue ?? "")
        self._website = State(wrappedValue: self._user.website.wrappedValue ?? "")
    }
    
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
                .onAppear {
                    KingfisherManager.shared.cache.clearCache()
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
        .onReceive(vm.$uploadComplete, perform: { complete in
            if complete {
                dismiss()
                
                self.user.name = vm.user.name
                self.user.bio = vm.user.bio
                self.user.location = vm.user.location
                self.user.website = vm.user.website
            }
        })
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: .constant(User.mockUser))
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
                dismiss()
            } label: {
                Text("Cancel")
                    .foregroundColor(.black)
                
            }
            
            Spacer()
            
            Button {
                if (selectedImage != nil) {
                    vm.uploadProfileImage(text: "text", image: selectedImage)
                    vm.uploadUserData(name: name, bio: bio, location: location, website: website)
                    KingfisherManager.shared.cache.clearCache()
                } else {
                    vm.uploadUserData(name: name, bio: bio, location: location, website: website)
                }
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
                KFImage(URL(string: "http://localhost:3000/users/\(vm.user.id)/avatar"))
                    .resizable()
                    .placeholder {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 65, height: 65)
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
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
