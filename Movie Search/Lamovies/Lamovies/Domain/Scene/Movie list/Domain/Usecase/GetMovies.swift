//
//  GetMovies.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/17/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import PromiseKit

struct GetMovies {
    
    private let moviesWebservice: MoviesWebservice
    
    init(moviesWebservice: MoviesWebservice = .init()) {
        self.moviesWebservice = moviesWebservice
    }

    func execute(movieName: String, movieYear: String, movieType: String) -> Promise<[DomainMovie]?> {
        moviesWebservice.performRequest(
            movieName: movieName,
            movieYear: movieYear,
            movieType: movieType
        ).map {
            movieResponses in
            movieResponses?.map{
                $0.toDomainModel()
            }
        }
    }
}
