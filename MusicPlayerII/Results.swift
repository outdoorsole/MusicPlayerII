//
//  Results.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import Foundation

// Struct modeled to store query data from Apple Music API:
// 1) number of tracks (resultCount) and 2) array of tracks (results)
struct Results {
    let resultCount: Int
    let results: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}
