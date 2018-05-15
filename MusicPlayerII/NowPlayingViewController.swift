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
    @IBOutlet weak var albumArtView: UIView!
    
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
        }
    }
}
