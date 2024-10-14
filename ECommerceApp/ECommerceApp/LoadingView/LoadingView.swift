//
//  LoadView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 30/09/24.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .scaleEffect(2)
            .padding(.top, 50)
    }
}
