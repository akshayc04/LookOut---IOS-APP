//
//  Endpoint.swift
//  LookOut
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseUrl)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum WeatherEndPoint: Endpoint {
    
    case tenDayForecat(city: String, state: String)
    
    var baseUrl: String {
        return "https://api.wunderground.com"
    }
    
    var path: String {
        switch self {
        case .tenDayForecat(let city, let state):
            return "/api/c59bcfac88fc5c15/forecast10day/q/\(state)/\(city).json"
        }
    }
    
        var queryItems: [URLQueryItem] {
            return []
        }

    }
