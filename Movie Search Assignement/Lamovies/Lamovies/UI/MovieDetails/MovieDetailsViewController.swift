//
//  MovieDetailsViewController.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieDetailsImageView: UIImageView!
    @IBOutlet weak var movieDetailsTitleLabel: UILabel!
    @IBOutlet weak var movieDetailsMetascoreLabel: UILabel!
    @IBOutlet weak var movieDetailsRatingLabel: UILabel!
    @IBOutlet weak var movieDetailsVotesLabel: UILabel!
    @IBOutlet weak var movieDetailsPlotLabel: UILabel!
    @IBOutlet weak var movieDetailsYearLabel: UILabel!
    @IBOutlet weak var movieDetailsTypeLabel: UILabel!
    @IBOutlet weak var movieDetailsDvdLabel: UILabel!
    @IBOutlet weak var movieDetailsRuntimeLabel: UILabel!
    @IBOutlet weak var movieDetailsDirectorLabel: UILabel!
    @IBOutlet weak var movieDetailsActorsLabel: UILabel!
    @IBOutlet weak var movieDetailsWriterlabel: UILabel!
    @IBOutlet weak var movieDetailsLanguageLabel: UILabel!
    @IBOutlet weak var movieDetailsCountryLabel: UILabel!
    @IBOutlet weak var movieDetailsAwardsLabel: UILabel!
    
    var currentMovie : Movie!
    var imdbId = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateIHM()
        
        WebRequestManager.shared.movieDetails(movieId: imdbId, success: { (newResult : Movie) in
            
            DispatchQueue.main.async {
                
                self.currentMovie = newResult
                self.updateIHM()
                
            }
            
        }) { (errorCurrent) in
            
            
        }
    }
    
    func updateIHM(){
        if currentMovie != nil {
            if currentMovie.poster != nil {
                movieDetailsImageView.downloadedFrom(link: currentMovie.poster!)
            }
            
            self.movieDetailsTitleLabel.text = currentMovie.title
            self.movieDetailsYearLabel.text = currentMovie.year
            self.movieDetailsMetascoreLabel.text = currentMovie.metascore
            self.movieDetailsRatingLabel.text = currentMovie.imdbRating
            self.movieDetailsVotesLabel.text = currentMovie.imdbVotes
            self.movieDetailsPlotLabel.text = currentMovie.plot
            self.movieDetailsTypeLabel.text = currentMovie.type
            self.movieDetailsDvdLabel.text = currentMovie.dvd
            self.movieDetailsRuntimeLabel.text = currentMovie.runtime
            self.movieDetailsDirectorLabel.text = currentMovie.director
            self.movieDetailsActorsLabel.text = currentMovie.actors
            self.movieDetailsWriterlabel.text = currentMovie.writer
            self.movieDetailsLanguageLabel.text = currentMovie.language
            self.movieDetailsCountryLabel.text = currentMovie.country
            self.movieDetailsAwardsLabel.text = currentMovie.awards
        } else {
            self.movieDetailsTitleLabel.text = ""
            self.movieDetailsYearLabel.text = ""
            self.movieDetailsMetascoreLabel.text = ""
            self.movieDetailsRatingLabel.text = ""
            self.movieDetailsVotesLabel.text = ""
            self.movieDetailsPlotLabel.text = ""
            self.movieDetailsTypeLabel.text = ""
            self.movieDetailsDvdLabel.text = ""
            self.movieDetailsRuntimeLabel.text = ""
            self.movieDetailsDirectorLabel.text = ""
            self.movieDetailsActorsLabel.text = ""
            self.movieDetailsWriterlabel.text = ""
            self.movieDetailsLanguageLabel.text = ""
            self.movieDetailsCountryLabel.text = ""
            self.movieDetailsAwardsLabel.text = ""
            self.movieDetailsImageView.image = UIImage(named: "clapperboard_grey")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
