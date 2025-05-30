//
//  MovieListView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 25/02/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel = MovieListViewModel()
    @State var searchText: String = "Hobbit"
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(imdbId: movie.id)) {
                    HStack {
                        AsyncImage(url: URL(string: movie.poster ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 100)
                        Text(movie.title)
                            .font(.title3)
                    }
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, newValue in
                viewModel.searchSubject.send(newValue)
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    MovieListView()
}
