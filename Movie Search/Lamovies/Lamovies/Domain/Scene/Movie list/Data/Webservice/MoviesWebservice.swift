//
//  MoviesWebservice.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/17/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import PromiseKit

class MoviesWebservice: BaseWebservice {
    
    override init() {
        super.init()
        httpMethod = .post
    }
    
    func performRequest(movieName: String?, movieYear: String?, movieType: String?) -> Promise<MoviesResponse> {
        //This has to be done like this because the api returns different response when the apikey is the starting parameter
        if let name = movieName, let year = movieYear, let type = movieType {
            url = "http://www.omdbapi.com/?s=\(name)&y=\(year)&t=\(type)&apikey=e8103610"
        }
        return super.performRequest()
    }
}
