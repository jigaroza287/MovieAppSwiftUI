//
//  AboutMovieTabContentView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 15/03/25.
//

import SwiftUI

struct AboutMovieTabContentView: View {
    let movie: Movie?
    
    private var movieDetails: [(String, String)] {
        [
            ("Released", movie?.released),
            ("Director", movie?.director),
            ("Writer", movie?.writer),
            ("Actors", movie?.actors),
            ("Language", movie?.language)
        ]
            .compactMap { key, value in
                guard let value = value, !value.isEmpty else { return nil }
                return (key, value)
            }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(movieDetails, id: \.0) { key, value in
                HStack {
                    Text(key)
                        .fontWeight(.bold)
                    Spacer()
                    Text(value)
                        .lineLimit(2)
                }
            }
        }
        .padding()
    }
}

#Preview {
    AboutMovieTabContentView(movie: nil)
}
