//
//  CartView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var isConfirmationPresented = false
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                if viewModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .tint(Color.white)
                    }
                } else {
                    VStack(spacing: 20) {
                        Text("WeMovies")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                        
                        ZStack {
                            Color("BackgroundColorList")
                                .ignoresSafeArea()
                            
                            Text("Carrinho de compras")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing], 40)
                                .padding(.top, -300)
                            
                            if cartViewModel.cartItems.isEmpty {
                                EmptyStateView(action: {
                                })
                                .padding(.top, 40)
                                
                                VStack {
                                    Spacer()
                                    BlueButton(
                                        title: "Recaregar página",
                                        action: {
                                            viewModel.fetchMovies()
                                        },
                                        maxWidth: 195
                                    )
                                    .padding(.bottom, 38.5)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                            } else {
                                VStack(spacing: 20) {
                                    // Lista Itens no Carrinho
                                    ScrollView {
                                        LazyVStack(spacing: 15) {
                                            ForEach(cartViewModel.cartItems) { item in
                                                CartItemView(
                                                    item: item,
                                                    remove: {
                                                        cartViewModel.removeFromCart(item)
                                                    },
                                                    increase: {
                                                        cartViewModel.increaseQuantity(item)
                                                    },
                                                    decrease: {
                                                        cartViewModel.decreaseQuantity(item)
                                                    }
                                                )
                                                .background(Color.white)
                                                .cornerRadius(10)
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                    }
                                }
                                .padding(.top, 10)
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
