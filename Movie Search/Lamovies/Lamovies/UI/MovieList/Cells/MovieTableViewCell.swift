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
        // Initialization code
    }
    
    func configureCell(movieObject: DomainMovie) {
        movieCellContainerView.layer.cornerRadius = 5
        if let movieTitle = movieObject.title {
            movieTitleLabel.text = movieTitle
        } else {
            movieTitleLabel.text = ""
        }
        
        if let movieYear = movieObject.year {
            movieYearLabel.text = movieYear
        } else {
            movieYearLabel.text = ""
        }
        
        if let movieImage = movieObject.poster {
            movieImageView.downloadedFrom(link: movieImage)
        } 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
