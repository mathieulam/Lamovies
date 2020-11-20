//
//  GetMovie.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/20/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import PromiseKit

struct GetMovie {
    
    let movieWebservice: MovieWebservice
    
    init(movieWebservice: MovieWebservice = .init()) {
        self.movieWebservice = movieWebservice
    }
    
    func execute(with identifier: String) -> Promise<Movie> {
        movieWebservice.performRequest(identifier: identifier).map{ $0.toDomainModel() }
    }
}
