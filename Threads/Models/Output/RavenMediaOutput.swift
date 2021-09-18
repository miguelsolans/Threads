//
//  RavenMediaOutput.swift
//  Threads
//
//  Created by Miguel Solans on 18/09/2021.
//

import Foundation

struct RavenMedia: Decodable {

    let width: Int?
    let height: Int?
    let images: ImageVersioningOutput?
    
    
    enum CodingKeys: String, CodingKey {
        case width = "original_width"
        case height = "original_height"
        case images = "image_versions2"
        
    }
}
