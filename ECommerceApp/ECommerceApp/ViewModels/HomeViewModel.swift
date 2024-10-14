//
//  SwiftUIView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI
import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMovies() {
        print("Carregamento dos filmes")
        self.isLoading = true
        APIService.shared.fetchMovies()
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    print("Filmes carregados")
                    break
                case .failure(let error):
                    print("Erro ao carregar filmes: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { movies in
                print("Recebidos \(movies.count) filmes.")
                self.movies = movies
            }
            .store(in: &cancellables)
    }
}
