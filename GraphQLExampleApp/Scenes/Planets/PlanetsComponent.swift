//  
//  PlanetsComponent.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct PlanetsComponent<Model: PlanetsComponentModelProtocol>: View {
    @StateObject var model: Model

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
            .task {
                await model.onAppear()
            }
    }
}

#Preview {
    PlanetsComponent(
        model: PlanetsComponentModelMock()
    )
}
