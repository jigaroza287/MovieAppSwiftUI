//
//  ContentView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: MovieViewModel = .init()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                HStack {
                    AsyncImage(url: movie.poster) { image in
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
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, newValue in
                viewModel.searchSubject.send(newValue)
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    ContentView()
}
