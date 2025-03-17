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
            ("Actors", movie?.actors),
            ("Language", movie?.language)
        ]
            .compactMap { key, value in
                guard let value = value, !value.isEmpty else { return nil }
                return (key, value)
            }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie?.plot ?? "")
            ForEach(movieDetails, id: \.0) { key, value in
                HStack {
                    Text(key)
                        .fontWeight(.bold)
                    Spacer()
                    Text(value)
                        .lineLimit(2)
                }
            }
            NavigationLink(destination: EmptyView()) {
                Text("See all movie info >")
                    .padding(.top)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal)
    }
}

#Preview {
    AboutMovieTabContentView(movie: nil)
}
