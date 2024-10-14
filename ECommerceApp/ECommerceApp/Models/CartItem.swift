//
//  CartItem.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 28/09/24.
//
import SwiftUI
import Foundation

struct CartItem: Identifiable, Codable {
    let id: Int
    let movie: Movie
    var quantity: Int
    
    var subtotal: Double {
        return Double(quantity) * movie.price
    }
}
