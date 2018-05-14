//
//  Track.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import Foundation

// Struct modeled to store data from one track returned from Apple Music API
struct Track: Codable {
    let artist: String?
    let track: String?
    let artwork: String?
    let previewURL: String?
    let collectionName: String?
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case track = "trackName"
        case artwork = "artworkUrl60"
        case previewURL = "previewUrl"
        case collectionName = "collectionName"
    }
}
