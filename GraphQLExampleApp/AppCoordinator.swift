//  
//  AppCoordinator.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    private var container: Container

    init(container: Container) {
        self.container = container
    }

    var rootView: some View {
        FilmsFlowCoordinator.rootView(
            with: FilmsFlowCoordinator(container: container)
        )
    }
}

extension AppCoordinator: AppDelegateProtocol {
    // swiftlint:disable:next discouraged_optional_collection
    func applicationDidFinishLaunching(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    }
}
