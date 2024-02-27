//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 23/2/24.
//

import SwiftUI

struct FeedCell: View {
    
    let post:Post
    
    var body: some View {
        VStack {
            // Image + user  name
            HStack {
                if let user = post.user{
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack(spacing: 16) {
                Button(action: {
                    print("Like post")
                }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                
                Button(action: {
                    print("Comment on post")
                }, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                })
                
                Button(action: {
                    print("Share post")
                }, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(.black)
            
            // likes label
            
            Text("\(post.likes)")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            // caption label
            
            HStack{
                Text("\(post.user?.username ?? "")")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading,10)
            .padding(.top,1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
