//
//  MovieWebservice.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/20/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import PromiseKit

class MovieWebservice: BaseWebservice {
    
    override init() {
        super.init()
        httpMethod = .post
    }
    
    func performRequest(identifier: String) -> Promise<MovieResponse> {
        //This has to be done like this because the api returns different response when the apikey is the starting parameter
        url = "http://www.omdbapi.com/?i=\(identifier)&apikey=e8103610"
        return super.performRequest()
    }
}
