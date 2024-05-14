//  
//  FilmDetailComponentModel.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import Foundation
import FuturedArchitecture

protocol FilmDetailComponentModelProtocol: ComponentModel {
    var film: Film { get }

    func onAppear() async
    func planetTapped(id: String)
}

final class FilmDetailComponentModel: FilmDetailComponentModelProtocol {

    let onEvent: (Event) -> Void

    private let dataCache: DataCache<DataCacheModel>
    private let resource: FilmDetailResource

    @Published var film: Film

    init(
        dataCache: DataCache<DataCacheModel>,
        resource: FilmDetailResource,
        film: Film,
        onEvent: @escaping (Event) -> Void
    ) {
        self.dataCache = dataCache
        self.resource = resource
        self.film = film
        self.onEvent = onEvent
    }

    func onAppear() async {
        await dataCache.$value
            .receive(on: DispatchQueue.main)
            .compactMap { $0.films?.first { $0.id == self.film.id } }
            .removeDuplicates()
            .assign(to: &$film)

        await fetchData()
    }

    func fetchData() async {

    }

    func planetTapped(id: String) {

    }
}

extension FilmDetailComponentModel {
    enum Event {

    }
}

final class FilmDetailComponentModelMock: FilmDetailComponentModelProtocol {
    var film: Film {
        Film(id: "filmId", name: "Film 1", releaseDate: "20.12.1974", director: "Director", planets: [
            Planet(id: "planetIdd", name: "Planet 1", population: 10000, gravity: "Gravity level")
        ]
        ) }

    func planetTapped(id: String) {
        
    }
    
    typealias Event = FilmDetailComponentModel.Event

    var onEvent: (FilmDetailComponentModel.Event) -> Void = { _ in }
    
    func onAppear() async {
    }
}
