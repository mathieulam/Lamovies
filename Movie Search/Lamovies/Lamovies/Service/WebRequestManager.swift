//
//  WebRequestManager.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

class WebRequestManager {
    static let shared = WebRequestManager()
    
    
    func movieList(name: String, year: String, type: String,
        success: @escaping ([Movie]) -> (),
        failure: @escaping (Error?) -> ()) {
        
        let urlPath = URL_API_OMDB + "?s=\(name)&" + "y=\(year)&" + "t=\(type)&" + "apikey=e8103610"
        
        WebRequestServices.getMoviesList(urlPath: urlPath, success: success, failure: failure)
    }
    
    func movieDetails(movieId: String,
                           success: @escaping (Movie) -> (),
                           failure: @escaping (Error?) -> ()) {
        
        let urlPath = URL_API_OMDB + "?i=\(movieId)&" + "apikey=e8103610"
        
        WebRequestServices.getMovieDetail(urlPath: urlPath, success: success, failure: failure)
    }
}
