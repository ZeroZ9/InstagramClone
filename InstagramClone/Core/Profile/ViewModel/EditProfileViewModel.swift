//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 11/3/24.
//

import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task { await loadImage(fromItem: selectedImage)}}
    }
    
    @Published var profileImage: Image?
    
    @Published  var fullname = ""
    @Published  var bio = ""
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        
        guard let uiImage =  UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update the profile image if changed
        
        // update name if changed
        
        // update bio if changed
    }
}
