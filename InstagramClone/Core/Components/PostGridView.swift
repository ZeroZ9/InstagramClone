//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 27/2/24.
//

import SwiftUI

struct PostGridView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1 ,content: {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        })
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
