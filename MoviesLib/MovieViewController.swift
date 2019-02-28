//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import AVKit

class MovieViewController: UIViewController {

    //MARK: - Properties
    var movie: Movie?
    var trailer: String = ""
    var moviePlayer: AVPlayer?
    var moviePlayerController: AVPlayerViewController?
    
    //MARK: - IBOutlets
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var tvSummary: UITextView!

    
    //MARK: - SuperMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = movie?.title {
            loadTrailer(title: title)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let movie = movie {
            
            ivPoster.image = movie.image as? UIImage
            lbTitle.text = movie.title
            lbCategories.text = movie.categories
            lbRating.text = "⭐️\(movie.rating)/10"
            lbDuration.text = movie.duration
            tvSummary.text = movie.summary
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieRegisterViewController {
            vc.movie = movie
        }
    }
    
    //MARK: - Methods
    func loadTrailer(title: String) {
        
        API.loadTrailers(title: title) { (apiResult) in
            guard let results = apiResult?.results, let trailer =
                results.first else {return}
            
            self.trailer = trailer.previewUrl
            DispatchQueue.main.async{
                self.prepareVideo()
            }
        }
        
    }
    
    func prepareVideo() {
        
        guard let url = URL(string: trailer) else {return}
        moviePlayer = AVPlayer(url: url)
        moviePlayerController = AVPlayerViewController()
        moviePlayerController?.player = moviePlayer
        moviePlayerController?.showsPlaybackControls = true
        
    }
    
    //MARK: - IBActions
    @IBAction func playMovieTrailer(_ sender: UIButton) {
        
        guard let moviePlayerController = moviePlayerController else {return}
        present(moviePlayerController, animated: true, completion: nil)
        
    }
    
}
