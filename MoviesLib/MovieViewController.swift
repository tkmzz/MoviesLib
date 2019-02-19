//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            
            /*ivPoster.image = UIImage(named: movie.image)
            lbTitle.text = movie.title
            lbCategories.text = movie.categories
            lbRating.text = "⭐️\(movie.rating)/10"
            lbDuration.text = movie.duration
            tvSummary.text = movie.summary
            */
        }
        
    }

    
}
