//
//  Movie.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import Foundation

struct MovieResponse {
    let results: [Movie]
}

struct Movie {
    let id: Int
    let original_title: String?
    let original_name: String?
    let overview: String?
    let poster_path: String?
    let media_type: String?
    let release_date: String?
    let first_air_date: String?
    let vote_average: Double?
    let vote_count: Int?
}
