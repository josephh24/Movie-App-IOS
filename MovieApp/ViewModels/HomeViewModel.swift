//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = true
    @Published var errorMessage: String? = nil

    func fetchPopularMovies() async {
        do {
            isLoading = true
            let result: [Movie] = try await APIClient.shared.fetch("/movies/popular")
            self.movies = result
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}

