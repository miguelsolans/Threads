//
//  Items.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import Foundation

struct ItemsOutput : Decodable {
    let itemId : String;
    let userId : Int;
    let timestamp : Int;
    let itemType : String;
    let media: RavenMedia?
    let text : String?;
    let reelShare : ReelShareOutput?;
    
    
    
    enum CodingKeys: String, CodingKey {
        case itemId = "item_id"
        case userId = "user_id"
        case itemType = "item_type"
        case timestamp = "timestamp"
        case media = "raven_media"
        case text = "text"
        case reelShare = "reel_share"
    }
}
