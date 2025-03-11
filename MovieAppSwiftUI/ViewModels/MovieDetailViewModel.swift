//
//  MovieDetailViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 09/03/25.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables: Set<AnyCancellable> = []
    
    var httpClient: HTTPClient
    
    init (httpClient: HTTPClient = .init(environment: .development)) {
        self.httpClient = httpClient
    }
    
    func fetchMovieDetail(imdbId: String) {
        httpClient.fetchMovieDetails(imdbId: imdbId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                self.isLoading = false
                
                switch completion {
                case .finished:
                    break
                case .failure(let error as APIError):
                    self.errorMessage = error.localizedDescription
                default:
                    self.errorMessage = "An unexpected error occurred."
                }
            } receiveValue: { [weak self] movies in
                guard let self else { return }
                self.movie = movies
            }
            .store(in: &cancellables)
    }
}
