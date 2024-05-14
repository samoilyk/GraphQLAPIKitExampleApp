//
//  PlanetView.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct PlanetView: View {
    let planet: Planet
    let action: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(planet.name)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .contentShape(Rectangle())
        .onTapGesture {
            action(planet.id)
        }
    }
}
