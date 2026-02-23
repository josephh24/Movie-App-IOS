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
        HStack(spacing: 12) {
            AsyncImage(url: posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)

                Text(movie.tagline ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("⭐️ \(String(format: "%.1f", movie.rating))")
                    .font(.caption)
            }
        }
        .padding(.vertical, 4)
    }

    private var posterURL: URL? {
        guard let path = movie.images.poster?.first else { return nil }
        return URL(string: "https://" + path)
    }
}

