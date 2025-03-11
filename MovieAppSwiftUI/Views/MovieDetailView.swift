//
//  MovieDetailView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 09/03/25.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: MovieDetailViewModel
    var imdbId: String
    
    init(imdbId: String, viewModel: MovieDetailViewModel = .init()) {
        self.imdbId = imdbId
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.1))
            } else if let movie = viewModel.movie {
                MovieView(movie: movie)
            } else if let errorMessage = viewModel.errorMessage {
                                MovieView(movie: nil)
//                ErrorMessageView(errorMessage: errorMessage)
            }
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .padding(10)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            .padding(.leading, 20)
        }
        .task {
            viewModel.fetchMovieDetail(imdbId: imdbId)
        }
        .navigationBarBackButtonHidden(true)
    }
}

private struct MovieView: View {
    let movie: Movie?
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: movie?.poster ?? "https://m.media-amazon.com/images/M/MV5BNGE0YTVjNzUtNzJjOS00NGNlLTgxMzctZTY4YTE1Y2Y1ZTU4XkEyXkFqcGc@._V1_SX300.jpg")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: .top)
            
            VStack(alignment: .leading,  spacing: 8) {
                Text(movie?.title ?? "Movie Title")
                    .font(.largeTitle)
                    .bold()
                HStack {
                    Image(systemName: "calendar")
                    Text(movie?.year ?? "2018")
                        .font(.footnote)
                    Text("|")
                        .padding(.horizontal, 4)
                    Image(systemName: "clock")
                    Text(movie?.runtime ?? "143 min")
                        .font(.footnote)
                    Text("|")
                        .padding(.horizontal, 4)
                    Image(systemName: "ticket")
                    Text(movie?.genre ?? "Action")
                        .font(.footnote)
                }
                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct ErrorMessageView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Text(errorMessage)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MovieDetailView(imdbId: "")
}
