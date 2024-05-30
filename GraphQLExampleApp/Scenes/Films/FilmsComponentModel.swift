//  
//  FilmsComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import Combine
import Foundation
import FuturedArchitecture

struct FilmsComponentData: Equatable {
    let films: [Film]
    let people: [Person]
    let planets: [Planet]
}

protocol FilmsComponentModelProtocol: ComponentModel {
    var data: FilmsComponentData? { get }

    func tapped(on film: Film)
    func onAppear() async
}

final class FilmsComponentModel: FilmsComponentModelProtocol {

    let onEvent: (Event) -> Void

    @Published var data: FilmsComponentData?

    private let dataCache: DataCache<DataCacheModel>
    private let resource: FilmsResourceProtocol

    init(
        dataCache: DataCache<DataCacheModel>,
        resource: FilmsResourceProtocol,
        onEvent: @escaping (Event) -> Void
    ) {
        self.dataCache = dataCache
        self.resource = resource
        self.onEvent = onEvent
    }

    func onAppear() async {
        await dataCache.$value
            .receive(on: DispatchQueue.main)
            .compactMap { data in
                guard let films = data.films, let people = data.people else {
                    return nil
                }

                return FilmsComponentData(films: films, people: people)
            }
            .removeDuplicates()
            .assign(to: &$data)

        await fetch()
    }

    func fetch() async {
        switch await resource.getFilms() {
        case let .success((films, people)):
            var cache = await dataCache.value
            cache.people = people
            cache.films = films
            await dataCache.update(with: cache)
        case .failure(let error):
            onEvent(.alert(title: error.localizedDescription, message: ""))
        }
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
final class FilmsComponentModelMock: FilmsComponentModelProtocol {
    
    func tapped(on film: Film) {

    }
    
    var data: FilmsComponentData? { nil }

    typealias Event = FilmsComponentModel.Event

    var onEvent: (FilmsComponentModel.Event) -> Void = { _ in }

    func onAppear() async { }
}
#endif
