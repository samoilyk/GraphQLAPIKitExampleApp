//
//  ApiService.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import ApolloAPI
import GraphQLAPIKit

protocol ApiServiceProtocol {
    func fetch<Query: GraphQLQuery>(query: Query) async -> Result<Query.Data, GraphQLAPIAdapterError>

    func perform<Mutation: GraphQLMutation>(mutation: Mutation) async -> Result<Mutation.Data, GraphQLAPIAdapterError>
}

final class ApiService: ApiServiceProtocol {
    let apiAdapter: GraphQLAPIAdapter

    init(apiAdapter: GraphQLAPIAdapter) {
        self.apiAdapter = apiAdapter
    }

    func fetch<Query>(query: Query) async -> Result<Query.Data, GraphQLAPIKit.GraphQLAPIAdapterError> where Query : ApolloAPI.GraphQLQuery {
        await apiAdapter.fetch(query: query)
    }

    func perform<Mutation>(mutation: Mutation) async -> Result<Mutation.Data, GraphQLAPIKit.GraphQLAPIAdapterError> where Mutation : ApolloAPI.GraphQLMutation {
        await apiAdapter.perform(mutation: mutation)
    }
}
