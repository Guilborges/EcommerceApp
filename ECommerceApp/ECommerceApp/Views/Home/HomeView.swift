//
//  SwiftUIView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()

                VStack {
                    Text("WeMovies")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)

                    Spacer(minLength: 10)

                    // estados: carregando, Erro ou Lista de Filmes
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(2)
                            .padding(.top, 50)
                    } else if viewModel.errorMessage != nil {
                        ZStack {
                            Color("BackgroundColorList")
                                .ignoresSafeArea()

                            VStack {
                                Spacer()

                                Image("EmptyCard")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    .padding(.horizontal, 20)

                                BlueButton(
                                    title: "Recarregar página",
                                    action: {
                                        viewModel.fetchMovies()
                                    },
                                    maxWidth: 195
                                )
                                .padding(.top, -73)
                                .padding(.bottom, 38.5)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    } else {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Mais vendidos")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top, 10)

                                Text("Maiores sucessos do WeMovies")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                Spacer(minLength: 20)

                                // Lista de filmes
                                LazyVStack(spacing: 30) {
                                    ForEach(viewModel.movies) { movie in
                                        MovieRowView(movie: movie) {
                                            cartViewModel.addToCart(movie)
                                        }
                                        .padding(.horizontal, 20)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .background(Color("BackgroundColorList").ignoresSafeArea())
                    }

                    Spacer()
                }
            }
            .onAppear {
                viewModel.fetchMovies()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartViewModel())
    }
}


