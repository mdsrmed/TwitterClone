//
//  TwitterUser.swift
//  TwitterClone
//
//  Created by Md Shohidur Rahman on 5/29/23.
//

import Foundation
import Firebase

struct TwitterUser: Codable{
    let id: String
    var displayName: String = ""
    var username: String = ""
    var followersCount: Double = 0
    var followingCount: Double = 0
    var createdOn: Data = Data()
    var bio: String = ""
    var avatarPath: String = ""
    var isUserOnBoarded: Bool = false
    
    
    init(from user: User){
        self.id = user.uid
    }
    
    
}
