//
//  MovieDetailsViewController.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, CanUpdateViewDelegate {

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
    
    var presenter: MovieDetailsPresenter!
    var imdbId = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = MovieDetailsPresenter(canUpdateViewDelegate: self)
        presenter.getMovieDetails(with: imdbId)
    }
    
    func updateData() {
        let movie = presenter.movieDetails()
        
        if let poster = movie?.poster {
            movieDetailsImageView.downloadedFrom(link: poster)
        } else {
            movieDetailsImageView.image = UIImage(named: "clapperboard_grey")
        }
        
        movieDetailsTitleLabel.text = movie?.title
        movieDetailsYearLabel.text = movie?.year
        movieDetailsMetascoreLabel.text = movie?.metascore
        movieDetailsRatingLabel.text = movie?.imdbRating
        movieDetailsVotesLabel.text = movie?.imdbVotes
        movieDetailsPlotLabel.text = movie?.plot
        movieDetailsTypeLabel.text = movie?.type
        movieDetailsDvdLabel.text = movie?.dvd
        movieDetailsRuntimeLabel.text = movie?.runtime
        movieDetailsDirectorLabel.text = movie?.director
        movieDetailsActorsLabel.text = movie?.actors
        movieDetailsWriterlabel.text = movie?.writer
        movieDetailsLanguageLabel.text = movie?.language
        movieDetailsCountryLabel.text = movie?.country
        movieDetailsAwardsLabel.text = movie?.awards
    }
}
