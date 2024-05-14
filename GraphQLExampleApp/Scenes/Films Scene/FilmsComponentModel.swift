//  
//  FilmsComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import FuturedArchitecture

protocol FilmsComponentModelProtocol: ComponentModel {
    func onAppear() async
}

final class FilmsComponentModel: FilmsComponentModelProtocol {

    let onEvent: (Event) -> Void

    private let dataCache: DataCache<DataCacheModel>
    private let resource: FilmsResource

    init(
        dataCache: DataCache<DataCacheModel>,
        resource: FilmsResource,
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

extension FilmsComponentModel {
    enum Event {

    }
}

final class FilmsComponentModelMock: FilmsComponentModelProtocol {
    typealias Event = FilmsComponentModel.Event

    var onEvent: (FilmsComponentModel.Event) -> Void = { _ in }
    
    func onAppear() async {
    }
}
