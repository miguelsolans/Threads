//
//  UserOutput.swift
//  Threads
//
//  Created by Miguel Solans on 29/08/2021.
//

import Foundation


struct UserOutput: Decodable {
    let pk: Int
    let username: String
    let fullname: String
    let profilePicture: String
    
    let friendshipStatus: FriendshipOutput
 
    
    enum CodingKeys: String, CodingKey {
        case pk = "pk"
        case username = "username"
        case fullname = "full_name"
        case profilePicture = "profile_pic_url"
        case friendshipStatus = "friendship_status"
    }
}

struct FriendshipOutput: Decodable {
    let following: Bool
    let blocking: Bool
    let isPrivate: Bool?
    let isBestie: Bool?
    let isRestricted: Bool?
    
    enum Codingkeys: String, CodingKey {
        case following = "following"
        case blocking = "blocking"
        case isPrivate = "is_private"
        case isBestie = "is_bestie"
        case isRestricted = "is_restricted"
    }
}
