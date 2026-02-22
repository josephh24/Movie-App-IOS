//
//  HomeView.swift
//  MovieApp
//
//  Created by jose pablo sanchez guillen on 22/02/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if vm.isLoading {
                    ProgressView("Cargando películas...")
                } else if let error = vm.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    List(vm.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRowView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Películas Populares")
        }
        .task {
            await vm.fetchPopularMovies()
        }
    }
}
