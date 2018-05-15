//
//  NowPlayingViewController.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var albumArtView: UIView!
    
    var currentTrack: Track?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
