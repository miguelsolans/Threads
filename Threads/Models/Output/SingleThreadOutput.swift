//
//  SingleThreadOutput.swift
//  Threads
//
//  Created by Miguel Solans on 29/08/2021.
//

import Foundation

struct SingleThreadOutput: Decodable {
    var thread: ThreadOutput;
    
    enum CodingKeys: String, CodingKey {
        case thread = "thread"
    }
}
