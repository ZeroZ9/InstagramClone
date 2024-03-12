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
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        //NavigationStack{
            ScrollView{
                VStack {
                    // HEADER
                    ProfileHeaderView(user: user)
                    
                    // POST GRID VIEW
                    PostGridView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
