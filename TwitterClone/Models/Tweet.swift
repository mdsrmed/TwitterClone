//
//  Tweet.swift
//  TwitterClone
//
//  Created by Md Shohidur Rahman on 6/5/23.
//

import Foundation

struct Tweet: Codable {
    var  id = UUID().uuidString
    let author: TwitterUser
    let tweetContent: String
    var likesCount: Int
    var likers: [String]
    let isReply: Bool
    let parentReference: String?
}
