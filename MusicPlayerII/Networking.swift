//
//  Networking.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved. 
//

import Foundation

// iTunes Search base URL
let iTunesSearchBaseURL = URL(string: "https://itunes.apple.com/search")!

// URL extension: Use search queries to construct new URL (with key/value pairs as parameters)
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

// MARK: - Helper method

// creates new URL to query iTunes server with described search info
func createURL(name: String) -> URL? {
    // create query dictionary with selected music artist name
    let iTunesQuery: [String: String] = [
        "term": name,
        "media": "music",
        "lang": "en_us",
        "limit": "100"
    ]
    return iTunesSearchBaseURL.withQueries(iTunesQuery)
}
