//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 7/3/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        VStack {
            
            // toolbar
            VStack{
                HStack{
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        print("update profile info")
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    })
                }
                .padding(.horizontal)
                
                Divider()
            }
            // edit porilfe pic
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack{
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            // edit profile findo
            
            VStack {
                
                EditProfileRowView(title: "Name", placeholder: "Enter Your Name", text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading,8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}


#Preview {
    EditProfileView()
}
