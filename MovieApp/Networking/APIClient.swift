//
//  APIClient.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    func fetch<T: Decodable>(_ path: String) async throws -> T {
        guard let request = TraktAPI.request(for: path) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
