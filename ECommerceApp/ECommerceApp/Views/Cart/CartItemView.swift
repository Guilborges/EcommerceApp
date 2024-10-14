//
//  CartItemView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI

struct CartItemView: View {
    let item: CartItem
    let remove: () -> Void
    let increase: () -> Void
    let decrease: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                // Filmes img
                AsyncImage(url: URL(string: item.movie.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 80, height: 120)
                .cornerRadius(8)
                .shadow(radius: 4)
                
                // Info Filme
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.movie.title)
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(height: 60)
                    
                    Text("Adicionado em: \(formattedDate())")
                        .frame(height: -40)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.leading, 5)
                
                Spacer()
                
                VStack {
                    Spacer().frame(height: 50)

                    Button(action: remove) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color("ButtomColor"))
                            .imageScale(.large)
                    }
                    
                    Spacer()
                }
            }
            
            HStack {
                // Controle Quantidade
                HStack(spacing: 10) {
                    Button(action: decrease) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(Color("ButtomColor"))
                            .font(.title2)
                    }
                    
                    Text("\(item.quantity)")
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                        .background(Color("ButtonColor"))
                        .cornerRadius(5)
                    
                    Button(action: increase) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color("ButtomColor"))
                            .font(.title2)
                    }
                }
                
                Spacer()
                
               
                VStack(alignment: .leading, spacing: 2) {
                    Text("SUBTOTAL")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(String(format: "R$%.2f", item.subtotal))
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
            
            Divider()
                .background(Color.gray.opacity(0.3))
            
            VStack(alignment: .leading, spacing: 10) {
               
                HStack {
                    Text("TOTAL")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(String(format: "R$%.2f", item.subtotal))
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                
                NavigationLink(destination: ConfirmationView()) {
                    Text("Finalizar Pedido")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("ButtomColor"))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .cornerRadius(10)
    }
    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: Date())
    }
}


struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(
            item: CartItem(
                id: 1,
                movie: Movie(id: 1, title: "Viúva Negra", price: 9.99, image: "https://wefit-react-web-test.s3.amazonaws.com/viuva-negra.png"),
                quantity: 2
            ),
            remove: {
 
            },
            increase: {

            },
            decrease: {

            }
        )
        .previewLayout(.sizeThatFits)
    }
}
