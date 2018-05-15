//
//  FavoritesTableViewController.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/14/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reload saved favorites
        favorites.reload()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.favoriteTracks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = favorites.favoriteTracks[indexPath.row].artist
        cell.detailTextLabel?.text = favorites.favoriteTracks[indexPath.row].track
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            favorites.favoriteTracks.remove(at: indexPath.row)
            // save the change to file
            favorites.save()
            // animate the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
