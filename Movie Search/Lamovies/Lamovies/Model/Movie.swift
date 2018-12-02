//
//  Movie.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

struct MoviesList : Codable {
    
    var movies: [Movie]?
    
    init(movies: [Movie]?) {
        self.movies = movies
    }
    
    enum MoviesListModelKeys: String, CodingKey {
        case movies = "Search"
    }

    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MoviesListModelKeys.self)
        let movies = try container.decodeIfPresent([Movie].self, forKey: .movies)
        self.init(movies: movies)
    }
}

struct  Movie: Codable{
    
    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var metascore: String?
    
    var imdbID: String?
    var imdbRating: String?
    var imdbVotes: String?
    var website: String?
    var boxOffice: String?
    
    var type: String?
    var dvd: String?
    var production: String?
    
    
    init(title: String?, year: String?, rated: String?, released: String?, runtime: String?, genre: String?, director: String?, writer:  String?, actors: String?, plot: String?, language: String?, country: String?, awards: String?, poster: String?, metascore: String?, imdbID: String?, imdbRating: String?, imdbVotes: String?, website: String?, boxOffice: String?, type: String?, dvd: String?, production: String?) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
        self.metascore = metascore
        self.imdbID = imdbID
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.website = website
        self.boxOffice = boxOffice
        self.type = type
        self.dvd = dvd
        self.production = production
    }
    
    enum MoviesModelKeys: String, CodingKey {
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MoviesModelKeys.self)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let year = try container.decodeIfPresent(String.self, forKey: .year)
        let rated = try container.decodeIfPresent(String.self, forKey: .rated)
        let released = try container.decodeIfPresent(String.self, forKey: .released)
        let runtime = try container.decodeIfPresent(String.self, forKey: .runtime)
        let genre = try container.decodeIfPresent(String.self, forKey: .genre)
        let director = try container.decodeIfPresent(String.self, forKey: .director)
        let writer = try container.decodeIfPresent(String.self, forKey: .writer)
        let actors = try container.decodeIfPresent(String.self, forKey: .actors)
        let plot = try container.decodeIfPresent(String.self, forKey: .plot)
        let language = try container.decodeIfPresent(String.self, forKey: .language)
        let country = try container.decodeIfPresent(String.self, forKey: .country)
        let awards = try container.decodeIfPresent(String.self, forKey: .awards)
        let poster = try container.decodeIfPresent(String.self, forKey: .poster)
        let metascore = try container.decodeIfPresent(String.self, forKey: .metascore)
        let imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID)
        let imdbRating = try container.decodeIfPresent(String.self, forKey: .imdbRating)
        let imdbVotes = try container.decodeIfPresent(String.self, forKey: .imdbVotes)
        let website = try container.decodeIfPresent(String.self, forKey: .website)
        let boxOffice = try container.decodeIfPresent(String.self, forKey: .boxOffice)
        let type = try container.decodeIfPresent(String.self, forKey: .type)
        let dvd = try container.decodeIfPresent(String.self, forKey: .dvd)
        let production = try container.decodeIfPresent(String.self, forKey: .production)
        
        self.init(title: title, year: year, rated: rated, released: released, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, awards: awards, poster: poster, metascore: metascore, imdbID: imdbID, imdbRating: imdbRating, imdbVotes: imdbVotes, website: website, boxOffice: boxOffice, type: type, dvd: dvd, production: production)
    }

}

