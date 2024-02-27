//
//  Post.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 27/2/24.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "This is some test caption for now", likes: 111, imageUrl: "doremon", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "This is handsome", likes: 200, imageUrl: "doremon1", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "hihiihahah", likes: 200, imageUrl: "doremon2", timestamp: Date(), user: User.MOCK_USERS[2])
    ]
}
