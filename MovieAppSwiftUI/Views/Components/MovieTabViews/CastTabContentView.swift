//
//  CastTabContentView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 15/03/25.
//

import SwiftUI

struct CastTabContentView: View {
    let movie: Movie?

    var body: some View {
        VStack {
            Text("Movie Cast")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    CastTabContentView(movie: nil)
}
