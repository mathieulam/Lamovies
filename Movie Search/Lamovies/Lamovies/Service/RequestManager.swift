//
//  RequestManager.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 2/3/18.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import Foundation

class RequestManager {
    
    static func getMoviesList(
        path: String,
        success: @escaping ([Movie]) -> (),
        failure: @escaping (Error?) -> ()) {
        
        
        
        let pathClean = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: pathClean)!
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let movieList = try JSONDecoder().decode(MoviesList.self, from: data)
                guard let movies = movieList.movies else {return}
                success(movies)
            } catch let jsonError {
                print("Error serializing json: ", jsonError)
            }
        }.resume()
        
    }
    
    
    static func getMovieDetails(
        path: String,
        success: @escaping (Movie) -> (),
        failure: @escaping (Error?) -> ()) {
        
        
        
        let url = URL(string: path)!
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                success(movie)
            } catch let jsonError {
                print("Error serializing json: ", jsonError)
            }
        }.resume()
    }
}
