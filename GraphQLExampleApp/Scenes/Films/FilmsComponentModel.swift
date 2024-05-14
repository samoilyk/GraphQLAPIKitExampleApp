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

    func tappedOnFilm(with id: String)
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

    func tappedOnFilm(with id: String) {
        onEvent(.filmTapped(id: id))
    }

    func onApear() {
        // fetch data
    }
}

extension FilmsComponentModel {
    enum Event {
        case filmTapped(id: String)
        case alert(title: String, message: String)
    }
}

#if DEBUG
final class FilmsComponentModelMock: ExampleComponentModelProtocol {
    var films: [Film]? {
        [
            Film(id: "1", name: "Film 1"),
            Film(id: "2", name: "Film 2"),
            Film(id: "3", name: "Film 3"),
            Film(id: "4", name: "Film 4")
        ]
    }

    func tappedOnFilm(with id: String) {
        //
    }
    
    typealias Event = FilmsComponentModel.Event

    var onEvent: (FilmsComponentModel.Event) -> Void = { _ in }

    func onAppear() async { }
}
#endif
