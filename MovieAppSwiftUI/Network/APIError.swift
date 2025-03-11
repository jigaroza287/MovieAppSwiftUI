//
//  APIError.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 09/03/25.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case networkError(URLError)
    case serverError(Int)
    case decodingError(DecodingError)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .serverError(let statusCode):
            return "Server responded with error code: \(statusCode)"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .unknown(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        }
    }
}
