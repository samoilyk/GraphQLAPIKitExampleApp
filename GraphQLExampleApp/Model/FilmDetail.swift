//
//  FilmDetail.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import Foundation

struct FilmDetail: Equatable {
    let id: String
    let name: String
    let releaseDate: String
    let director: String
    let planets: [Planet]
}
