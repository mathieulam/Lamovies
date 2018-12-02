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
    var movieList = [Movie]()
    
    
    //MARK:- init
    
    init(movieListView: MovieListProtocol) {
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
        
        WebRequestManager.shared.movieList(name : title, year: year, type: type, success: { (movies : [Movie]) in
            
            DispatchQueue.main.async {
                self.movieList = movies
                self.view?.reloadData()
                //self.view?.showMovieList(newMovies: newResult)
            }
            
        }) { (errorCurrent) in
            
        }
        
    }
    
    func getMovieListCount() -> Int {
        return self.movieList.count
    }
    
    func getMovieList() -> [Movie] {
        return self.movieList
    }
}
