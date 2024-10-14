//
//  ProfileView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 30/09/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            CustomNavigationBar(title: "Perfil")
            Spacer()
            Text("Perfil")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
        }
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}
