//
//  WeatherAPIClient.swift
//  LookOut
//
//  Created by Akshay on 3/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation

class  WeatherAPICLient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    
    func weather(with endpoint: WeatherEndPoint, completion: @escaping (Either<ForecastText, APIError>) -> Void) {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either {
            case .value(let weather):
                let textForecast = weather.forecast.forecastText
                completion( .value(textForecast))
            case .error(let error):
                completion(.error(error))
            }
        }
        
    }
    
}
