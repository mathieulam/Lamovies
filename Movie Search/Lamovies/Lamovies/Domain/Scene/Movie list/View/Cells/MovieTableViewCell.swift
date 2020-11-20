//
//  MovieTableViewCell.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieCellContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(movieObject: Movie) {
        movieCellContainerView.layer.cornerRadius = 5
        movieTitleLabel.text = movieObject.title
        movieYearLabel.text = movieObject.year
        
        if let movieImage = movieObject.poster {
            movieImageView.downloadedFrom(link: movieImage)
        }
    }
}
