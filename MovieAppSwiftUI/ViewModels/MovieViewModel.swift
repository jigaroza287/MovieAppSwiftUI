//
//  MoviesViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 04/03/25.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    var searchSubject = CurrentValueSubject<String, Never>("")
    private var cancellables: Set<AnyCancellable> = []

    var httpClient: HTTPClient
    
    init (httpClient: HTTPClient) {
        self.httpClient = httpClient
        setUpSearchSubscription()
    }
    
    func setUpSearchSubscription() {
        searchSubject
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.fetchMovies()
            }
            .store(in: &cancellables)
    }
    
    func fetchMovies() {
        httpClient.fetchMovies(searchText: searchSubject.value)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.error = error
                }
            } receiveValue: { [weak self] movies in
                guard let self else { return }
                self.movies = movies
            }
            .store(in: &cancellables)
    }
}
