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
                LoadingView()
            } else if let movie = viewModel.movie {
                MovieContentView(movie: movie)
            } else if let errorMessage = viewModel.errorMessage {
                ErrorMessageView(errorMessage: errorMessage)
            }

            BackButton { dismiss() }
        }
        .task {
            viewModel.fetchMovieDetail(imdbId: imdbId)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Movie Content View
private struct MovieContentView: View {
    let movie: Movie

    var body: some View {
        VStack {
            MovieHeaderView(posterURL: movie.poster)
            MovieCommonDetailsView(movie: movie)
            MovieTabView(movie: movie)
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - Header View
private struct MovieHeaderView: View {
    let posterURL: String?

    var body: some View {
        AsyncImage(url: URL(string: posterURL ?? "")) { image in
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
    }
}

// MARK: - Movie Common Details View
private struct MovieCommonDetailsView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(movie.title)
                .font(.largeTitle)
                .bold()
            HStack {
                Image(systemName: "calendar")
                Text(movie.year)
                Text("|")
                Image(systemName: "clock")
                Text(movie.runtime ?? "")
                Text("|")
                Image(systemName: "ticket")
                Text(movie.genre ?? "")
            }
            .font(.footnote)
        }
        .padding(.horizontal)
    }
}

// MARK: - Loading View
private struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.1))
    }
}

// MARK: - Error Message View
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

// MARK: - Back Button
private struct BackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .font(.title)
                .padding(10)
                .background(Color.black.opacity(0.6))
                .clipShape(Circle())
                .foregroundColor(.white)
        }
        .padding(.leading, 20)
    }
}

#Preview {
    MovieDetailView(imdbId: "")
}
