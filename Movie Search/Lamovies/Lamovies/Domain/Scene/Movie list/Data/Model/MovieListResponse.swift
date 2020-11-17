//
//  MoviesResponse.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/17/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

struct MoviesResponse: Codable {
    
    var movies: [Movie]?
    
    init(movies: [Movie]?) {
        self.movies = movies
    }
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let movies = try container.decodeIfPresent([Movie].self, forKey: .movies)
        self.init(movies: movies)
    }
}
