//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster ?? "")")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 300)
                .cornerRadius(12)
                
                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(movie.overview ?? "Sin descripción")
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
}
