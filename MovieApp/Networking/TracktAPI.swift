//
//  TracktAPI.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation

enum TraktAPI {

    static var clientKey : String {
        guard let key = Bundle.main.infoDictionary?["TRAKT_CLIENT_ID"] as? String else {
            fatalError("TRAKT_CLIENT_ID not found in Secrets.xcconfig")
        }
        return key
    }
    
    static func request(for path: String) -> URLRequest? {
        guard let url = URL(string: "\(Endpoints.baseURL)\(path)") else { return nil }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("2", forHTTPHeaderField: "trakt-api-version")
        request.setValue(clientKey, forHTTPHeaderField: "trakt-api-key")
        return request
    }
}

