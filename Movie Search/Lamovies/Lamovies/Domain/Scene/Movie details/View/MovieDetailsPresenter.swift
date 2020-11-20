//
//  MovieDetailsPresenter.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/20/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import Foundation

class MovieDetailsPresenter: NSObject {
    
    weak var canUpdateViewDelegate: CanUpdateViewDelegate?
    
    private var movie: Movie?
    private let getMovie: GetMovie
    
    init(
        canUpdateViewDelegate: CanUpdateViewDelegate,
        getMovie: GetMovie = .init()
    ) {
        self.getMovie = getMovie
        super.init()
        self.canUpdateViewDelegate = canUpdateViewDelegate
    }
    
    func getMovieDetails(with identifier: String) {
        getMovie.execute(with: identifier).done {
            self.movie = $0
            self.canUpdateViewDelegate?.updateData()
        }.catch {
            error in
            print("Error \(error)")
        }
    }
    
    func movieDetails() -> Movie? {
        movie
    }
}
