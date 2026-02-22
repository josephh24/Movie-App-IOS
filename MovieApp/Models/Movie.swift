//
//  Movie.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let year: Int?
    let ids: TraktIDs
    let overview: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title, year, ids, overview, poster = "poster"
    }
}

struct TraktIDs: Decodable {
    let trakt: Int
    let slug: String
    let imdb: String?
}
