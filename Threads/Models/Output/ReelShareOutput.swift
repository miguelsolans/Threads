//
//  ReelShareOutput.swift
//  Threads
//
//  Created by Miguel Solans on 29/08/2021.
//

import Foundation

struct ReelShareOutput: Decodable {
    let text: String?;
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
}
