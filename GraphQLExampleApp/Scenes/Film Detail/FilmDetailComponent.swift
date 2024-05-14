//  
//  FilmDetailComponent.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct FilmDetailComponent<Model: FilmDetailComponentModelProtocol>: View {
    @StateObject var model: Model

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text(model.film.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("Director: \(model.film.director)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Release Date: \(model.film.releaseDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            List {
                ForEach(model.film.planets, id: \.id) { planet in
                    PlanetView(planet: planet, action: model.planetTapped(id:))
                }
            }
        }
        .task {
            await model.onAppear()
        }
    }
}

#Preview {
    FilmDetailComponent(
        model: FilmDetailComponentModelMock()
    )
}
