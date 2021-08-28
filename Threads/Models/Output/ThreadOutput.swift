//
//  Thread.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import Foundation

struct ThreadOutput : Decodable {
    let id: String;
    let secondId : String;
    let title: String;
    
    let items: [ItemsOutput];
    
    enum CodingKeys: String, CodingKey {
        case id = "thread_id"
        case secondId = "thread_v2_id"
        case title = "thread_title"
        case items = "items"
    }
}
