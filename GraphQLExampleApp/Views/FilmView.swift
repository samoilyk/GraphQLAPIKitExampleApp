//
//  FilmView.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct FilmView: View {
    let film: Film

    var body: some View {
        Text(film.name)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(8)
            .cornerRadius(10)
    }
}
