//
//  YoutubeSearchResponse.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
