//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 26/2/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack{
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
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        AuthService.shared.signout()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                }
            })
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
