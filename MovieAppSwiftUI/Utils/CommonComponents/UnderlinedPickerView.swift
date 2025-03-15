//
//  UnderlinedPickerView.swift
//  MovieAppSwiftUI
//
//  Created by Jigar Oza on 12/03/25.
//

import SwiftUI

struct UnderlinedPickerView: View {
    @Binding var selectedTabIndex: Int
    let options: [String]
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index])
                        .fontWeight(selectedTabIndex == index ? .bold : .regular)
                        .foregroundColor(selectedTabIndex == index ? .blue : .gray)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            withAnimation {
                                selectedTabIndex = index
                            }
                        }
                }
            }
            .background(Color.clear)

            GeometryReader { geometry in
                Capsule()
                    .frame(width: geometry.size.width / CGFloat(options.count), height: 3)
                    .foregroundColor(.blue)
                    .offset(x: (geometry.size.width / CGFloat(options.count)) * CGFloat(selectedTabIndex), y: 0)
                    .animation(.easeInOut(duration: 0.3), value: selectedTabIndex)
            }
            .frame(height: 3)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    UnderlinedPickerView(selectedTabIndex: .constant(0), options: ["About Movie", "Ratings", "Cast"])
}
