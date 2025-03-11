//
//  HTTPClient.swift
//  MovieApp
//
//  Created by Jigar Oza on 20/02/25.
//

import Foundation
import Combine

class HTTPClient {
    private var environment: APIEnvironment
    
    init(environment: APIEnvironment) {
        self.environment = environment
    }
    
    func fetchMovies(searchText: String) -> AnyPublisher<[Movie], Error> {
        guard let validSearch = searchText.urlEncoded,
              let url = URL(string: "\(environment.baseURL)?s=\(validSearch)&apikey=\(environment.apiKey)") else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        print("url: \(url)")
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.search)
            .catch { error in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func fetchMovieDetails(imdbId: String) -> AnyPublisher<Movie, Error> {
        guard let url = URL(string: "\(environment.baseURL)?i=\(imdbId)&apikey=\(environment.apiKey)") else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                return result.data
            }
            .decode(type: Movie.self, decoder: JSONDecoder())
            .mapError { error -> APIError in
                if let decodingError = error as? DecodingError {
                    return APIError.decodingError(decodingError)
                } else if let urlError = error as? URLError {
                    return APIError.networkError(urlError)
                } else {
                    return APIError.unknown(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
