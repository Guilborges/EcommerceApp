//
//  MovieRowView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//


import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    let addToCart: () -> Void
    @State private var cartCount: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
           AsyncImage(url: URL(string: movie.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(Color.gray.opacity(0.1))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(8)
                case .failure:
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(movie.title)
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
            
            Text(String(format: "R$%.2f", movie.price))
                .bold()
                .font(.subheadline)
                .foregroundColor(.black)
                .bold()
                .multilineTextAlignment(.center)
            
            Button(action: {
                addToCart()
                cartCount += 1
            }) {
                HStack(spacing: 8) {

                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                    
                    
                    if cartCount > 0 {
                        Text("\(cartCount)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    
                    Text("Adicionar ao Carrinho")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                }
                .frame(maxWidth: .infinity)
                .background(Color("ButtomColor"))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie(id: 1, title: "Viúva Negra", price: 9.99, image: "https://wefit-react-web-test.s3.amazonaws.com/viuva-negra.png")) {
        }
        .previewLayout(.sizeThatFits)
    }
}

