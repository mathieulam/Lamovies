//
//  MoviesResponse.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/17/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

struct MoviesResponse: Codable {
    
    var movies: [MovieResponse]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
