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
    func getFilms() async -> Result<[Film], Error>
}

struct FilmsResource: FilmsResourceProtocol {
    let apiService: ApiServiceProtocol

    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }

    func getFilms() async -> Result<[Film], Error> {
        let result = await apiService.fetch(query: AllFilmsQuery())

        switch result {
        case .success(let data):
            guard let films = data.allFilms?.films else {
                return .failure(FilmsResourceError.invalidData)
            }

            return .success(films.compactMap { $0.flatMap { Film(from: $0) } })
        case .failure(let error):
            return .failure(error)
        }
    }
}
