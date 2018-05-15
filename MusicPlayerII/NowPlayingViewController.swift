//
//  NowPlayingViewController.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit
import AVFoundation

class NowPlayingViewController: UIViewController {
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var albumArtView: UIImageView!
    
    var currentTrack: Track?
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set the text labels
        artistLabel.text = currentTrack?.artist
        trackLabel.text = currentTrack?.track
        albumLabel.text = currentTrack?.collectionName
        
        
        // play the track
        if let previewURLString = currentTrack?.previewURL,
            let previewURL = URL(string: previewURLString) {
            player = AVPlayer(url: previewURL)
            player.play()
            
            self.queryArtwork(url: (currentTrack?.artwork)!)
        }
    }
    
    func queryArtwork(url: String) {
        let searchUrl = URL(string: url)!
        
        let task = URLSession.shared.dataTask(with: searchUrl) { (data, response, error) in
            print("in queryArtwork completion handler")
            
            var displayImage: UIImage?
            
            if error != nil {
                print("Error in queryArtwork \(error!)")
            }
            
            if let imageData = data {
                displayImage = UIImage(data: imageData)
            }
            
            DispatchQueue.main.async {
                self.albumArtView.image = displayImage
            }
        }
        task.resume()
    }
    
    @IBAction func addToFavoritesPressed(_ sender: UIButton) {
        if currentTrack != nil {
            favorites.favoriteTracks.append(currentTrack!)
        }
    }
    
}
