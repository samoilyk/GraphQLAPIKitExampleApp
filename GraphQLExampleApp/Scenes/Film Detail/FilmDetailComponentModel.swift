//  
//  FilmDetailComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import FuturedArchitecture

protocol FilmDetailComponentModelProtocol: ComponentModel {
    func onAppear() async
}

final class FilmDetailComponentModel: FilmDetailComponentModelProtocol {

    let onEvent: (Event) -> Void

    private let dataCache: DataCache<DataCacheModel>
    private let resource: FilmDetailResource

    init(
        dataCache: DataCache<DataCacheModel>,
        resource: FilmDetailResource,
        onEvent: @escaping (Event) -> Void
    ) {
        self.dataCache = dataCache
        self.resource = resource
        self.onEvent = onEvent
    }

    func onAppear() async {
        // Subscribe to dataCache changes
        // Fetch fresh data
    }
}

extension FilmDetailComponentModel {
    enum Event {

    }
}

final class FilmDetailComponentModelMock: FilmDetailComponentModelProtocol {
    typealias Event = FilmDetailComponentModel.Event

    var onEvent: (FilmDetailComponentModel.Event) -> Void = { _ in }
    
    func onAppear() async {
    }
}
