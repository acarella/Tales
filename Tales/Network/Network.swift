//
//  Network.swift
//  Tales
//
//  Created by Antonio Carella on 6/26/20.
//

import Foundation
import Combine

enum NetworkError: Error {
    case unwrapping, noData
}

class Network {

    private let session: URLSession = {
        URLSession.shared.configuration.timeoutIntervalForRequest = 10.0
        return URLSession.shared
    }()


    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                print(String(data: result.data, encoding: .utf8))
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func get<T: Decodable>(request: Get, onCompletion: @escaping (Result<T, Error>) -> Void) {        
        session.dataTask(with: request.request()) { (data, response, error) in
            if let error = error {
                onCompletion(Result.failure(error))
            } else {
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        onCompletion(Result.success(result))
                    } catch {
                        print(error)
                        onCompletion(Result.failure(error))
                    }
                } else {
                    onCompletion(Result.failure(NetworkError.noData))
                }
            }
        }.resume()
    }
}

