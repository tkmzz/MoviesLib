//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadMovies()
    
    }
    
    func loadMovies() {
        
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension:"json") else {
            return
        }
        
        do{
            let jsonData = try Data(contentsOf: jsonURL)
            movies = try JSONDecoder().decode([Movie].self, from: jsonData)
            
        } catch{
            print(error)
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell?.prepare(with: movie)
        
        return cell!
    }
    
    /*override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104.0
    }*/


}
