//
//  EmptyStateView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI

struct EmptyStateView: View {
    let action: () -> Void
    
    var body: some View {
        
        VStack{

                VStack(spacing: 20) {
                    
                    Image("EmptyCard")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }.toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Título Personalizado")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                    }}
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(action: {
        })
        .previewLayout(.sizeThatFits)
    }
}
