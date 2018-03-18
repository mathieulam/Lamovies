//
//  MovieListPresenter.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

protocol MovieListProtocol : class {
    
    func showMovieList(newMovies : [Movie])
    
}

class MovieListPresenter: NSObject {
    
    weak var view:MovieListProtocol?
    
    
    //MARK:- init
    
    init(persoView: MovieListProtocol) {
        super.init()
        
        self.view = persoView
        
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
        
        WebRequestManager.shared.movieList(name : title, year: year, type: type, success: { (newResult : [Movie]) in
            
            DispatchQueue.main.async {
                self.view?.showMovieList(newMovies: newResult)
            }
            
        }) { (errorCurrent) in
            
        }
        
    }
    
    func viewDidLoad() {
        
        self.view?.showMovieList(newMovies: [])
        
    }
    
}
