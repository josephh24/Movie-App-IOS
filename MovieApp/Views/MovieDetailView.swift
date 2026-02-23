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
            VStack(spacing: 0) {

                // HEADER
                AsyncImage(url: headerImageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipped()

                // CONTENT
                VStack(alignment: .leading, spacing: 16) {

                    HStack(alignment: .top, spacing: 16) {
                        AsyncImage(url: posterURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.2)
                        }
                        .frame(width: 120)
                        .cornerRadius(12)

                        VStack(alignment: .leading, spacing: 8) {
                            Text(movie.title)
                                .font(.title2)
                                .bold()

                            Text(movie.tagline ?? "")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            HStack(spacing: 6) {
                                Text("⭐️ \(String(format: "%.1f", movie.rating))")
                                Text("• \(movie.year)")
                                if let runtime = movie.runtime {
                                    Text("• \(runtime) min")
                                }
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                    }

                    Divider()

                    Text("Overview")
                        .font(.headline)

                    Text(movie.overview)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Genres")
                        .font(.headline)

                    Text(movie.genres.joined(separator: ", "))
                        .font(.subheadline)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(movie.title)
        .background(Color(.systemBackground))
    }

    private var headerImageURL: URL? {
        if let fanart = movie.images.fanart?.first {
            return URL(string: "https://" + fanart)
        } else if let poster = movie.images.poster?.first {
            return URL(string: "https://" + poster)
        }
        return nil
    }

    private var posterURL: URL? {
        guard let poster = movie.images.poster?.first else { return nil }
        return URL(string: "https://" + poster)
    }
}



