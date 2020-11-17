//
//  BaseWebservice.swift
//  Lamovies
//
//  Created by Mathieu Lamvohee on 11/17/20.
//  Copyright © 2020 Mathieu Lamvohee. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class BaseWebservice {
    
    var httpMethod: HTTPMethod = .get
    var parameters: [String: String] = [:]
    
    var url: String = ""
}

extension BaseWebservice {
    
    func addParameter(key: String, value: String) {
        parameters.updateValue(value, forKey: key)
    }
    
    func performRequest<T>() -> Promise<T> where T : Codable {
        let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return Promise { seal in
            Alamofire.request(urlString, method: httpMethod, parameters: parameters, encoding: URLEncoding.queryString)
                .validate()
                .responseJSON {
                    response in
                    switch response.result {
                    case .success(let json):
                        guard
                            let json = json  as? [String: Any],
                            let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                        else {
                            return seal.reject(AFError.responseValidationFailed(reason: .dataFileNil))
                        }
                        
                        do {
                            let response = try JSONDecoder().decode(T.self, from: jsonData)
                            seal.fulfill(response)
                        } catch {
                            seal.reject(error)
                        }
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}
