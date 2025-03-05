//
//  APIEnvironment.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 05/03/25.
//

import Foundation

struct APIEnvironment {
    let baseURL: String
    
    static let development = APIEnvironment(baseURL: "http://www.omdbapi.com/")
}
