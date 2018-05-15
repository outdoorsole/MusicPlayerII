//
//  Favorites.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/14/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import Foundation

class Favorites {
    var favoriteTracks = [Track]()
    
    // save favorite tracks array to disk
    func save() {
        
        // encode the array
        var encodedFavorites: Data?
        let propertyListEncoder = PropertyListEncoder()
        encodedFavorites = try? propertyListEncoder.encode(favoriteTracks)
        if let encodedFavorites = encodedFavorites {
            print("we have encoded favorite tracks.  it is \(encodedFavorites.count) bytes")
        }
        
        // open up a file handle to write to
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let archiveURL = documentsDirectory[0].appendingPathComponent("favoriteTracksData").appendingPathExtension("plist")
        
        do {
            try encodedFavorites?.write(to: archiveURL, options: .noFileProtection)
            print("write of favorite track to file successful")
        } catch {
            print("error writing favorite tracks file")
        }
    }
}

let favorites = Favorites()
