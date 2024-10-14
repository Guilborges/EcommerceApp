//
//  ContentView.swift
//  ECommerceApp
//
//  Created by Guilherme Borges on 26/09/24.
//

import SwiftUI
import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let image: String
}
