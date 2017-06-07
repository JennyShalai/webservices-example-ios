//
//  RequestHandler.swift
//  consuming-webservices
//
//  Created by Stephen Wong on 9/13/16.
//  Copyright © 2016 Intrepid Pursuits. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}

enum RequestError: Error {
    case requestHandlerNil
    case invalidURL
    case noResponse
    case httpResponse(Int)
    case noData
}

extension RequestError: CustomStringConvertible {
    var description: String {
        switch self {
        case .requestHandlerNil:
            return "No Request Handler"
        case .invalidURL:
            return "Invalid URL"
        case .noResponse:
            return "No Response"
        case .httpResponse(let errorCode):
            return "HTTP Response: \(errorCode)"
        case .noData:
            return "No Data Returned"
        }
    }
}

struct HTTPRequestHandler: RequestHandler {
    var path: String
    var method: NetworkMethod
    var headers: [String : String]?
    var body: Any?
    
    func execute( callback: @escaping (Result<Any>) -> Void) {
        guard let url = URL(string: path) else {
            callback(.failure(RequestError.invalidURL))
            return
        }
        
        // create your URL Request
        
        if let headers = headers {
            for (key, value) in headers {
                // add each header value to the appropriate header key
            }
        }
        
        if let body = body {
            // set the httpBody of your request serialized JSON
        }
        
        // create a data task using URL Session with your new request
        // we'll need to case our response as an HTTPURLResponse
        // we'll also need to deserialize our data
        
        // you mind find this snippet handy for debugging
        //    if let str = String(data: data, encoding: String.Encoding.utf8) {
        //        print("Received response: \(str)")
        //    }
       
        //    task.resume()
        
        let fakeData = ["color": "#FF0000", "name": "Cookie Cat"]
        callback(.success(fakeData))
    }
}
