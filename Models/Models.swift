//
//  Models.swift
//  Instagram
//
//  Created by Vasil Panov on 8.4.21.
//

import Foundation

enum Gener {
    case male, female, other
}

struct User {
    let username:String
    let bio: String
    let name: (first: String, last: String)
    let gener: Gener
    let counts: UserCount
    let joinDate: Date
    let profilePhoto: URL
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType {
    case photo, video
}

// Represents a user post
public struct UserPost {
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [User]
}

struct PostLike {
    let username: String
    let postidentifier: String
}

struct CommentLike {
    let username: String
    let commentidentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes : [CommentLike]
}
