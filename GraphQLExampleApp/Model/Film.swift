//
//  Film.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import Foundation
import GraphQLGenerated

struct Film: Hashable {
    struct Details: Hashable {
        let releaseDate: String
        let director: String
        let planets: [Planet]
    }

    let id: String
    let name: String
    let details: Details?
}

extension Film {
    init?(from graphQlModel: AllFilmsQuery.Data.AllFilms.Film) {
        guard let name = graphQlModel.title else {
            return nil
        }
        self.id = graphQlModel.id
        self.name = name
        self.releaseDate = graphQlModel.releaseDate ?? ""
        self.director = graphQlModel.director ?? ""
        self.planets = []
    }
}
