//
//  MainTabView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var cartViewModel = CartViewModel()
    
    var body: some View {
        ZStack{
            TabView {
                
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Carrinho")
                    }
                    .environmentObject(cartViewModel)

                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .environmentObject(cartViewModel)
                
                        HomeView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Perfil")
                    }
                    .environmentObject(cartViewModel)
            }
            .accentColor(.white)
            
        }
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

