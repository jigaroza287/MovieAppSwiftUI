//
//  HTTPClient.swift
//  MovieApp
//
//  Created by Jigar Oza on 20/02/25.
//

import Foundation
import Combine

enum NetwrorkError: Error {
    case invalidURL
    case decodingFailed
}

class HTTPClient {
    func fetchMovies(searchText: String) -> AnyPublisher<[Movie], Error> {
        guard let validSearch = searchText.urlEncoded,
        let url = URL(string: "http://www.omdbapi.com/?s=\(validSearch)&apikey=c15c399c") else {
            return Fail(error: NetwrorkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.search)
            .catch { error in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
