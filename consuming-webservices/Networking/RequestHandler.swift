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
        var returnValue = 0
        if let body = body as? [String: String] {
            returnValue = body["args"] == "on" ? 1 : 0
        }
        
        let fakeData = ["return_value": returnValue, "result": 0]
        callback(.success(fakeData))
    }
}
