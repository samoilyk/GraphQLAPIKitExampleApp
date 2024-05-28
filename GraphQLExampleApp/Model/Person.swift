//
//  Person.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 28.05.2024.
//

import GraphQLGenerated
import Foundation

struct Person: Equatable {
    let id: String
    let name: String
    let gender: String?
    let skinColor: String?
}

extension Person {
    init?(from graphQlModel: AllFilmsQuery.Data.AllPeople.Person) {
        guard let name = graphQlModel.name else {
            return nil
        }
        self.id = graphQlModel.id
        self.name = name
        self.gender = graphQlModel.gender
        self.skinColor = graphQlModel.skinColor
    }
}
