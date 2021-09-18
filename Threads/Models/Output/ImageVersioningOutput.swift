//
//  ImageVersioningOutput.swift
//  Threads
//
//  Created by Miguel Solans on 18/09/2021.
//

import Foundation


struct ImageVersioningOutput : Decodable {
    
    let candidates: [ImageDataOutput]
    
    enum CodingKeys: String, CodingKey {
        case candidates = "candidates"
    }
}


struct ImageDataOutput : Decodable {
    
    let width: Int
    let height: Int
    let url: String
    
}
