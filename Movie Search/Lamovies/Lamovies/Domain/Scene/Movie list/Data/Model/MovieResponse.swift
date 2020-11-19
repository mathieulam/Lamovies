//
//  MovieResponse.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/17/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    
    let title: String?
    let year: String?
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let awards: String?
    let poster: String?
    let metascore: String?
    let imdbID: String?
    let imdbRating: String?
    let imdbVotes: String?
    let website: String?
    let boxOffice: String?
    let type: String?
    let dvd: String?
    let production: String?
    
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbID = "imdbID"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case website = "Website"
        case boxOffice = "BoxOffice"
        case type = "Type"
        case dvd = "DVD"
        case production = "Production"
    }
}

extension MovieResponse {
    
    func toDomainModel() -> Movie {
        .init(
            title: title,
            year: year,
            rated: rated,
            released: released,
            runtime: runtime,
            genre: genre,
            director: director,
            writer: writer,
            actors: actors,
            plot: plot,
            language: language,
            country: country,
            awards: awards,
            poster: poster,
            metascore: metascore,
            imdbID: imdbID,
            imdbRating: imdbRating,
            imdbVotes: imdbVotes,
            website: website,
            boxOffice: boxOffice,
            type: type,
            dvd: dvd,
            production: production
        )
    }
}
