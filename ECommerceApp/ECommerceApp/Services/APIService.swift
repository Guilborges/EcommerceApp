//
//  ServicesView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI
import Foundation
import Combine

class APIService {
    static let shared = APIService()
    private init() {}
    
    func fetchMovies() -> AnyPublisher<[Movie], Error> {
        guard let url = URL(string: "https://wefit-movies.vercel.app/api/movies") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .delay(for: .seconds(2), scheduler: DispatchQueue.main) //atrasei 2 seg pra testar
            .map { $0.data }
            .decode(type: ProductsResponse.self, decoder: JSONDecoder())
            .map { $0.products }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

