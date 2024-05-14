//  
//  FilmsComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import Combine
import Foundation
import FuturedArchitecture

protocol ExampleComponentModelProtocol: ComponentModel {
    var films: [Film]? { get }

    func tapped(on film: Film)
    func onAppear() async
}

final class FilmsComponentModel: ExampleComponentModelProtocol {

    let onEvent: (Event) -> Void

    @Published var films: [Film]?
    private let dataCache: DataCache<DataCacheModel>

    init(
        dataCache: DataCache<DataCacheModel>,
        onEvent: @escaping (Event) -> Void
    ) {
        self.dataCache = dataCache
        self.onEvent = onEvent
    }

    func onAppear() async {
        await dataCache.$value
            .receive(on: DispatchQueue.main)
            .compactMap { $0.films }
            .removeDuplicates()
            .assign(to: &$films)
    }

    func tapped(on film: Film) {
        onEvent(.filmTapped(film))
    }
}

extension FilmsComponentModel {
    enum Event {
        case filmTapped(Film)
        case alert(title: String, message: String)
    }
}

#if DEBUG
final class FilmsComponentModelMock: ExampleComponentModelProtocol {
    func tapped(on film: Film) {

    }
    
    var films: [Film]? {
        []
    }
    
    typealias Event = FilmsComponentModel.Event

    var onEvent: (FilmsComponentModel.Event) -> Void = { _ in }

    func onAppear() async { }
}
#endif
