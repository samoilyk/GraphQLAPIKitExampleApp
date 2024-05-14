//  
//  FilmsFlowCoordinator.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import FuturedArchitecture
import SwiftUI

final class FilmsFlowCoordinator: NavigationStackCoordinator {
    
    private var container: Container

    @Published var path: [Destination] = []
    @Published var sheet: Destination?
    @Published var fullscreenCover: Destination?
    @Published var alertModel: AlertModel?

    init(container: Container) {
        self.container = container
    }

    static func rootView(with instance: FilmsFlowCoordinator) -> some View {
        NavigationStackFlow(coordinator: instance) {
            FilmsComponent(
                model: FilmsComponentModel(
                    dataCache: instance.container.dataCache,
                    resource: FilmsResource(apiService: instance.container.apiService)
                ) { [weak instance] event in
                    switch event {
                    case let .filmTapped(film):
                        instance?.path.append(.filmDetail(film))
                    case let .alert(title, message):
                        instance?.alertModel = .init(title: title, message: message)
                    }
                }
            )
        }
    }

    @ViewBuilder
    func scene(for destination: Destination) -> some View {
        switch destination {
        case .filmDetail(let film):
            FilmDetailComponent(
                model: FilmDetailComponentModel(
                    dataCache: self.container.dataCache,
                    resource: FilmDetailResource(),
                    film: film,
                    onEvent: { _ in }
                )
            )
        }
    }
}

extension FilmsFlowCoordinator {
    enum Destination: Hashable, Identifiable {
        case filmDetail(Film)

        var id: String {
            switch self {
            case .filmDetail(let film):
                return "filmDetail:\(film.id)"
            }
        }
    }
}
