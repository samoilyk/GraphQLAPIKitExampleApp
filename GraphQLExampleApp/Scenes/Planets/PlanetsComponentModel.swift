//  
//  PlanetsComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import FuturedArchitecture

protocol PlanetsComponentModelProtocol: ComponentModel {
    func onAppear() async
}

final class PlanetsComponentModel: PlanetsComponentModelProtocol {

    let onEvent: (Event) -> Void

    private let dataCache: DataCache<DataCacheModel>
    private let resource: PlanetsResource

    init(
        dataCache: DataCache<DataCacheModel>,
        resource: PlanetsResource,
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

extension PlanetsComponentModel {
    enum Event {

    }
}

final class PlanetsComponentModelMock: PlanetsComponentModelProtocol {
    typealias Event = PlanetsComponentModel.Event

    var onEvent: (PlanetsComponentModel.Event) -> Void = { _ in }
    
    func onAppear() async {
    }
}
