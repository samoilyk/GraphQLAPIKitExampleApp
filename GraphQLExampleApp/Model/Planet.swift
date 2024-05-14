//
//  Planet.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import Foundation

struct Planet: Equatable {
    let id: String
    let name: String
    let population: Float
    let gravity: String
    let films: [Film]
}
