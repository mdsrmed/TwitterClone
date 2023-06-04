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
    var followersCount: Int = 0
    var followingCount: Int = 0
    var createdOn: Date = Date()
    var bio: String = ""
    var avatarPath: String = ""
    var isUserOnBoarded: Bool = false
    
    
    init(from user: User){
        self.id = user.uid
    }
    
    
}
