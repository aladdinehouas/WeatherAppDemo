//
//  APIError.swift
//  WeatherApp
//
//  Created by solinum.dev on 11/02/2024.
//

import Foundation

enum APIError: Error {
    case request(message: String)
    case network(message: String)
    case status(message: String)
    case parsing(message: String)
    case other(message: String)
    
    static func map(_ error: Error) -> APIError {
        return (error as? APIError) ?? .other(message: error.localizedDescription)
    }

}
