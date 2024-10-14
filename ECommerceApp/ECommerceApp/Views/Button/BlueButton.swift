//
//  BlueButton.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 27/09/24.
//

import SwiftUI

struct BlueButton: View {
    var title: String
    var action: () -> Void
    var cornerRadius: CGFloat = 12
    var font: Font = .headline
    var padding: EdgeInsets = EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
    var maxWidth: CGFloat? = nil
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .foregroundColor(.white)
                .padding(padding)
                .frame(maxWidth: maxWidth ?? .infinity)
                .background(Color("ButtomColor"))
                .cornerRadius(cornerRadius)
        }
        .padding(.horizontal, 20)
    }
}

struct BlueButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueButton(
            title: "Tentar Novamente",
            action: {
                
                print("Botão pressionado")
            }
        )
        .previewLayout(.sizeThatFits)
    }
}

