//  
//  Container.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import GraphQLAPIKit
import Foundation
import FuturedArchitecture

final class Container {
    let apiService: ApiServiceProtocol

    private(set) var dataCache = DataCache(value: DataCacheModel())

    init() {
        let apiAdapter = GraphQLAPIAdapter(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
        self.apiService = ApiService(apiAdapter: apiAdapter)
    }

    func resetContainer() {
        // Reset services
        self.dataCache = DataCache(value: DataCacheModel())
    }
}
