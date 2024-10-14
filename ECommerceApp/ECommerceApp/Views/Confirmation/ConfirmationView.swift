//
//  ConfirmationView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI

struct ConfirmationView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {

            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
               
                ZStack {
                    Color("WeMoviesBackgroundColor")
                        .frame(height: 60)
                    
                    Text("WeMovies")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 20) {
                    Spacer().frame(height: 40)
                    
                    
                    ScrollView {
                        ZStack {
                            
                            Image("ConfirmationCard")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            
                            
                            VStack {
                                Spacer()
                                BlueButton(
                                    title: "Recaregar página",
                                    action: {
                                        
                                        cartViewModel.confirmPurchase()
                                        
                                        presentationMode.wrappedValue.dismiss()
                                        
                                    },
                                    maxWidth: 195
                                )
                                .padding(.bottom, 28.5)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BackgroundColorList").ignoresSafeArea())
            }
        }
        .navigationBarHidden(true)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
            .environmentObject(CartViewModel())
    }
}

