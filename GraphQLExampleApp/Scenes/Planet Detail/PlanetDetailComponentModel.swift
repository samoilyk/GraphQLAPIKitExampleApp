//  
//  PlanetDetailComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import FuturedArchitecture

protocol PlanetDetailComponentModelProtocol: ComponentModel {
    func onAppear() async
}

final class PlanetDetailComponentModel: PlanetDetailComponentModelProtocol {

    let onEvent: (Event) -> Void

    private let dataCache: DataCache<DataCacheModel>
    private let resource: PlanetDetailResource

    init(
        dataCache: DataCache<DataCacheModel>,
        resource: PlanetDetailResource,
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

extension PlanetDetailComponentModel {
    enum Event {

    }
}

final class PlanetDetailComponentModelMock: PlanetDetailComponentModelProtocol {
    typealias Event = PlanetDetailComponentModel.Event

    var onEvent: (PlanetDetailComponentModel.Event) -> Void = { _ in }
    
    func onAppear() async {
    }
}
