//
//  Tweets.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

import Foundation

struct TweetsResponse: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    
    struct Meta: Codable {
        var oldestId: String
        var newestId: String
        var resultCount: Int
        var nextToken: String?
        
        private enum CodingKeys: String, CodingKey {
            case oldestId = "oldest_id", newestId = "newest_id", resultCount = "result_count", nextToken = "next_token"
        }
    }
    
    struct Includes: Codable {
        var users: [User]?
    }
    
    var data: [Tweet]?
    var meta: Meta?
    var includes: Includes?
}

public struct Tweet: Codable {
    var id: String
    var createdAt: Date
    var authorId: String
    var text: String
    
    private enum CodingKeys: String, CodingKey {
        case id, createdAt = "created_at", authorId = "author_id", text
    }
}

public struct User: Codable {
    var id: String
    var name: String?
    var username: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, username
    }
}

