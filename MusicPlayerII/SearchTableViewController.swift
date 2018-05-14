//
//  SearchTableViewController.swift
//  MusicPlayerII
//
//  Created by Maribel Montejano on 5/7/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    var searchName: String?
    var currentTracks: [Track] = []
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentTracks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = currentTracks[indexPath.row].artist
        cell.detailTextLabel?.text = currentTracks[indexPath.row].track
        
        return cell
    }
    
    // MARK: - Search Bar method
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search bar search button pressed")
        if let searchTerm = searchBar.text {
            search(term: searchTerm)
        }
        searchBar.resignFirstResponder()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue called")
        // Get the new view controller using segue.destinationViewController.
        if let destination = segue.destination as? NowPlayingViewController {
            print(destination)
        }
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - Helper method
    func search(term: String) {
        if let url = createURL(name: term) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print("in the completion handler for data task")
                
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data {
                    print(data)
                    let jsonDecoder = JSONDecoder()
                    
                    if let result = try? jsonDecoder.decode(Results.self, from: data) {
                        print(result)
                        self.currentTracks = result.results
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
