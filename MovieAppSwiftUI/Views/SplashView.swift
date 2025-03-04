//
//  SplashView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 04/03/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image("MovieIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text("Movie App")
                .font(.system(size: 28).bold())
                .foregroundStyle(.red)
                .padding()
        }
    }
}

#Preview {
    SplashView()
}
