//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbRate: UILabel!
    @IBOutlet weak var lbSummary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with movie: Movie){
        ivPoster.image = movie.image as? UIImage
        lbTitle.text = movie.title
        lbRate.text = "⭐️ \(movie.rating)/10"
        lbSummary.text = movie.summary
    }

}
