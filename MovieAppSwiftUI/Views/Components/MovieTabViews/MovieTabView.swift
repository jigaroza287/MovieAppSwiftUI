//
//  MovieTabView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 12/03/25.
//

import SwiftUI

struct MovieTabView: View {
    let movie: Movie?
    @State private var selectedTabIndex = 0
    let movieTabs = ["About Movie", "Ratings", "Cast"]
    
    var body: some View {
        VStack {
            UnderlinedPickerView(selectedTabIndex: $selectedTabIndex, options: movieTabs)
            TabView(selection: $selectedTabIndex) {
                AboutMovieTabContentView(movie: movie).tag(0)
                RatingsTabContentView(movie: movie).tag(1)
                CastTabContentView(movie: movie).tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

#Preview {
    MovieTabView(movie: nil)
}
