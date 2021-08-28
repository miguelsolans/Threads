//
//  Inbox.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import Foundation

struct InboxOutput: Decodable {
    let threads: [ThreadOutput];
    
    enum CodingKeys: String, CodingKey {
        case threads = "threads"
    }
}
