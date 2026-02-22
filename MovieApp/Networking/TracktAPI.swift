//
//  TracktAPI.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation

enum TraktAPI {
    static let clientID = "99627351af2cdda2bc407b28cf25d3c4eacf1a2ea0b1316e22dbc4a86ae4ff72" // Coloca tu Trakt Client ID
    
    static func request(for path: String) -> URLRequest? {
        guard let url = URL(string: "\(Endpoints.baseURL)\(path)") else { return nil }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("2", forHTTPHeaderField: "trakt-api-version")
        request.setValue(clientID, forHTTPHeaderField: "trakt-api-key")
        return request
    }
}
