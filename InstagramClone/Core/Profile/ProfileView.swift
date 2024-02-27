//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 20/2/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        //NavigationStack{
            ScrollView{
                VStack {
                    // HEADER
                    VStack(spacing: 12) {
                        
                        // pic and stat
                        HStack {
                            Image(user.profileImageUrl ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            HStack(spacing: 8){
                                UserStatView(value: 3, title: "Posts")
                                
                                UserStatView(value: 12, title: "Followers")
                                
                                UserStatView(value: 3, title: "Following")
                            }
                        }
                        .padding(.horizontal)
                        
                        // name and bio
                        VStack(alignment: .leading) {
                            if let fullname = user.fullname{
                                Text(fullname)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            
                            if let bio = user.bio{
                                Text(bio)
                                    .font(.footnote)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // action button
                        Button(action: {}, label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32 )
                                .foregroundStyle(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.gray, lineWidth: 1))
                        })
                        
                        Divider()
                    }
                    
                    // POST GRID VIEW
                    LazyVGrid(columns: gridItems, spacing: 1 ,content: {
                        Image("doremon")
                            .resizable()
                            .scaledToFit()
                        
                        Image("doremon1")
                            .resizable()
                            .scaledToFit()
                        
                        Image("doremon1")
                            .resizable()
                            .scaledToFit()
                    })
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
