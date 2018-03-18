//
//  Movie.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesList : Mappable {
    
    var objectResult : [Movie]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        objectResult <- map["Search"]
        
    }
}

class  Movie: Mappable{
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
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["Title"]
        year <- map["Year"]
        rated <- map["Rated"]
        
        released <- map["Released"]
        runtime <- map["Runtime"]
        genre <- map["Genre"]
        director <- map["Director"]
        writer <- map["Writer"]
        actors <- map["Actors"]
        plot <- map["Plot"]
        language <- map["Language"]
        country <- map["Country"]
        awards <- map["Awards"]
        poster <- map["Poster"]
        metascore <- map["Metascore"]
        
        imdbID <- map["imdbID"]
        imdbRating <- map["imdbRating"]
        imdbVotes <- map["imdbVotes"]
        website <- map["Website"]
        boxOffice <- map["BoxOffice"]
        type <- map["Type"]
        dvd <- map["DVD"]
        production <- map["Production"]
        
    }

}

