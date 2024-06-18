//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Aladdin Houas on 18/06/2024.
//

import Foundation
import Combine

protocol WeatherFetchable {
    func fetchWeather(for cityName: String) -> AnyPublisher<CityWeather, APIError>
}

class WeatherAPI {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension WeatherAPI {
    struct WeatherAPIComponent {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5/weather"
    }
    
    func urlComponentForWeather(for cityName: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = WeatherAPIComponent.scheme
        components.host = WeatherAPIComponent.host
        components.path = WeatherAPIComponent.path
        components.queryItems = [
          URLQueryItem(name: "q", value: cityName ),
          URLQueryItem(name: "APPID", value: "4a3528ea68cda6cb4b58544aae986969" ),
          URLQueryItem(name: "units", value: "metric" )
        ]
        
        return components
    }
}

extension WeatherAPI: WeatherFetchable, Fetchable {
    func fetchWeather(for cityName: String) -> AnyPublisher<CityWeather, APIError> {
        return fetch(with: self.urlComponentForWeather(for: cityName), session: self.session)
    }
}

