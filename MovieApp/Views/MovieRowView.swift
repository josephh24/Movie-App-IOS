//
//  MovieRowView.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.poster ?? "")")) { image in
                image.resizable()
            } placeholder: {
                Rectangle().fill(.gray.opacity(0.3))
            }
            .frame(width: 70, height: 110)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                Text("\(movie.year ?? 0)")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}
