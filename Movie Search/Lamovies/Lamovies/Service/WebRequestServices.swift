//
//  WebRequestServices.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

class WebRequestServices {
    
    static func getMoviesList(urlPath: String,
                              success: @escaping ([MovieResponse]) -> (),
                              failure: @escaping (Error?) -> ()) {
        
        RequestManager.getMoviesList(path: urlPath, success: success, failure: failure)
        
    }
    
    static func getMovieDetail(urlPath: String,
                               success: @escaping (MovieResponse) -> (),
                               failure: @escaping (Error?) -> ()) {
        RequestManager.getMovieDetails(path: urlPath, success: success, failure: failure)
        
    }
    
}
