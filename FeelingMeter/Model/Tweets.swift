//
//  Tweets.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

public struct Tweets: Codable {
    var data: [DataContent]?
    var meta: MetaContent?
    
    private enum CodingKeys: CodingKey {
        case data, meta
    }
}

public struct DataContent: Codable {
    var id: String?
    var text: String?
    
    private enum CodingKeys: CodingKey {
        case id, text
    }
}

public struct MetaContent: Codable {
    var oldest_id: String?
    var newest_id: String?
    var result_count: Int?
    var next_token: String?
    
    private enum CodingKeys: CodingKey {
        case oldest_id, newest_id, result_count, next_token
    }
}
