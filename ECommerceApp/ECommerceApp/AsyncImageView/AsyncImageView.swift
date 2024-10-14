//
//  AsyncImageView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 30/09/24.
//

import Foundation
import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    let placeholder: Image
    let errorImage: Image

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                placeholder
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                errorImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}
