//
//  MovieListPresenter.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

protocol MovieListProtocol : class {
    func reloadData()
}

class MovieListPresenter: NSObject {
    
    weak var view:MovieListProtocol?
    var movieList = [DomainMovie]()
    
    private let getMovies: GetMovies
    
    //MARK:- init
    
    init(
        movieListView: MovieListProtocol,
        getMovies: GetMovies = .init()
    ) {
        self.getMovies = getMovies
        super.init()
        
        self.view = movieListView
        
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
            self.movieList = movies
            self.view?.reloadData()
        }.catch {
            error in
            print("Error \(error)")
        }
    }
    
    func getMovieListCount() -> Int {
        return self.movieList.count
    }
    
    func getMovieList() -> [DomainMovie] {
        return self.movieList
    }
}
