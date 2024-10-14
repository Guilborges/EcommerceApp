//
//  CartViewModel.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//
import SwiftUI
import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    var total: Double {
        cartItems.reduce(0) { $0 + $1.subtotal }
    }
    
    func addToCart(_ movie: Movie) {
        if let index = cartItems.firstIndex(where: { $0.movie.id == movie.id }) {
            cartItems[index].quantity += 1
        } else {
            let newItem = CartItem(id: movie.id, movie: movie, quantity: 1)
            cartItems.append(newItem)
        }
    }
    
    func removeFromCart(_ cartItem: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            cartItems.remove(at: index)
        }
    }
    
    func increaseQuantity(_ cartItem: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            cartItems[index].quantity += 1
        }
    }
    
    func decreaseQuantity(_ cartItem: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                removeFromCart(cartItem)
            }
        }
    }
    
    
    
    func confirmPurchase() {
        cartItems.removeAll()
    }
}

