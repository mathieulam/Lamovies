//
//  MovieListPresenter.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

class MovieListPresenter: NSObject {
    
    weak var canUpdateViewDelegate: CanUpdateViewDelegate?
    
    private var movies: [Movie] = []
    private let getMovies: GetMovies
    
    init(
        canUpdateViewDelegate: CanUpdateViewDelegate,
        getMovies: GetMovies = .init()
    ) {
        self.getMovies = getMovies
        super.init()
        self.canUpdateViewDelegate = canUpdateViewDelegate
        
    }
    
    func searchMovies(movieTitle : String?, movieYear: String?, movieType: String?){
        var title = ""
        var year = ""
        var type = ""
        
        if movieTitle != nil && !movieTitle!.isEmpty {
            title = movieTitle!
        }
        
        if movieYear != nil && !movieYear!.isEmpty {
            year = movieYear!
        }
        
        if movieType != nil && !movieType!.isEmpty {
            type = movieType!
        }
        
        
        getMovies.execute(movieName: title, movieYear: year, movieType: type).done {
            guard let movies = $0 else { return }
            self.movies = movies
            self.canUpdateViewDelegate?.updateData()
        }.catch {
            error in
            print("Error \(error)")
        }
    }
    
    func getMovieListCount() -> Int {
        movies.count
    }
    
    func getMovieList() -> [Movie] {
        movies
    }
}
