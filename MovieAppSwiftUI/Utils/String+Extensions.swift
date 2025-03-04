//
//  String+Extensions.swift
//  MovieApp
//
//  Created by Jigar Oza on 20/02/25.
//

import Foundation

extension String {
    
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
