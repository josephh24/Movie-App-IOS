//
//  TracktAPI.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation

enum TraktAPI {
    static let clientID: String = {
        let key = "TraktClientID"
        // 1) Try Info.plist first
        if let infoValue = Bundle.main.object(forInfoDictionaryKey: key) as? String, !infoValue.isEmpty {
            return infoValue
        }
        // 2) Fallback to Secrets.plist in the main bundle
        if let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
           let data = try? Data(contentsOf: url),
           let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
           let secretsValue = plist[key] as? String, !secretsValue.isEmpty {
            return secretsValue
        }
        #if DEBUG
        assertionFailure("Missing or empty \(key). Provide it in Info.plist or Secrets.plist.")
        #endif
        return ""
    }()
    
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

