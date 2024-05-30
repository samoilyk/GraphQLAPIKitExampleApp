//  
//  FilmsResource.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import GraphQLGenerated
import GraphQLAPIKit

enum FilmsResourceError: Error {
    case invalidData
}

protocol FilmsResourceProtocol {
    func getFilms() async -> Result<([Film], [Person]), Error>
}

struct FilmsResource: FilmsResourceProtocol {
    let apiService: ApiServiceProtocol

    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }

    func getFilms() async -> Result<([Film], [Person]), Error> {
        let result = await apiService.fetch(query: AllFilmsQuery())

        switch result {
        case .success(let data):
            guard let graphQLfilms = data.allFilms?.films, let graphQLPeople = data.allPeople?.people else {
                return .failure(FilmsResourceError.invalidData)
            }

            let films = graphQLfilms.compactMap { $0.flatMap { Film(from: $0) } }
            let people = graphQLPeople.compactMap { $0.flatMap { Person(from: $0)} }
            return .success((films, people))
        case .failure(let error):
            return .failure(error)
        }
    }
}
