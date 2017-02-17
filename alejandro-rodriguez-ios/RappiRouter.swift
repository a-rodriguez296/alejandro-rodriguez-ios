//
//  RappiRouter.swift
//  alejandro-rodriguez-ios
//
//  Created by Alejandro Rodriguez on 2/17/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import Alamofire


enum RappiRouter: URLRequestConvertible {
    case topApplications
    
    static let baseURLString = Constants.Endpoints.BaseURL.baseURL
    
    var method: HTTPMethod {
        switch self {
        case .topApplications:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .topApplications:
            return Constants.Endpoints.TopApplications.topApplications
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try RappiRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}

