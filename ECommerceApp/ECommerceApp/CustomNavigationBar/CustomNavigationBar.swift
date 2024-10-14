//
//  CustomNavigationBar.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 30/09/24.
//

import Foundation
import SwiftUI

struct CustomNavigationBar: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.horizontal, 20)
    }
}
