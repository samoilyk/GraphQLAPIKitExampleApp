//
//  PersonView.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 28.05.2024.
//

import SwiftUI

struct PersonView: View {
    let person: Person

    var body: some View {
        Text(person.name)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(8)
            .cornerRadius(10)
    }
}
