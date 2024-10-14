//
//  Errorview.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 30/09/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let errorMessage: String?
    let retryAction: () -> Void

    var body: some View {
        VStack {
            Spacer()
            Image("EmptyCard")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 20)
            BlueButton(
                title: "Recarregar página",
                action: retryAction,
                maxWidth: 195
            )
            .padding(.top, -73)
            .padding(.bottom, 38.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
