//
//  Movie.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation

struct Movie: Identifiable, Codable {
    let title: String
    let year: Int
    let ids: Ids
    let tagline: String?
    let overview: String
    let runtime: Int?
    let country: String?
    let rating: Double
    let genres: [String]
    let images: Images

    var id: Int { ids.trakt }
}

struct Ids: Codable {
    let trakt: Int
    let slug: String
    let imdb: String?
    let tmdb: Int?
}

struct Images: Codable {
    let poster: [String]?
    let fanart: [String]?
    let thumb: [String]?
}


