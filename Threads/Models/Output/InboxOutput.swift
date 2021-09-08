//
//  Inbox.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import Foundation

struct InboxOutput: Decodable {
    let threads: [ThreadOutput];
    let hasOlder: Bool;
    let unseenCount: Int
    
    enum CodingKeys: String, CodingKey {
        case threads = "threads"
        case hasOlder = "has_older"
        case unseenCount = "unseen_count"
    }
}
