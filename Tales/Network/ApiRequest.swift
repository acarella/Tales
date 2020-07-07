//
//  ApiRequest.swift
//  Tales
//
//  Created by Antonio Carella on 6/26/20.
//

import Foundation

protocol ApiRequest {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [String: String] { get }
    var httpMethod: String { get }
    var dedableType: Decodable.Type { get }
    func request() -> URLRequest
}

extension ApiRequest {
    var host: String {
        return "the-cocktail-db.p.rapidapi.com".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var headers: [String: String] {
        return [ "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com", "x-rapidapi-key": "Ku7wOs26gImshFipVrU34klwFVukp1FeHztjsno6fcdpSkYWYo" ]
    }

    var scheme: String {
        return "https"
    }

    func request() -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = httpMethod
        return request
    }
}
