//
//  FilmView.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct FilmView: View {
    let film: Film
    let action: (String) -> Void

    var body: some View {
        Text(film.name)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .contentShape(Rectangle())
            .onTapGesture {
                action(film.id)
            }
    }
}
