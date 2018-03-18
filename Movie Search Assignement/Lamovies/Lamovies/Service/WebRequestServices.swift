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
                            success: @escaping ([Movie]) -> (),
                            failure: @escaping (Error?) -> ()) {
        
        RequestManager.getMoviesList( path: urlPath,
                                  completion: { _resultOMDB in
                                    
                                    if let __resultOMDB = _resultOMDB as? [Movie] {
                                        success(__resultOMDB)
                                    }
                                    
        }, failure: failure)
        
    }
    
    static func getMovieDetail(urlPath: String,
                         success: @escaping (Movie) -> (),
                         failure: @escaping (Error?) -> ()) {
        
        RequestManager.getMovieDetails( path: urlPath,
                                  completion: { _resultOMDB in
                                    
                                    if let __resultOMDB = _resultOMDB as? Movie {
                                        success(__resultOMDB)
                                    }
                                    
        }, failure: failure)
        
    }
    
}