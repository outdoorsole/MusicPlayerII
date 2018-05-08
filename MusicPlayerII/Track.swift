//
//  Track.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import Foundation

// Struct modeled to store data from one track returned from Apple Music API
struct Track {
    let artistName: String?
    let trackName: String?
    let artworkUrl60: String?
    
    enum CodingKeys: String, CodingKey {
        case artist
        case track
        case artwork
    }
}
