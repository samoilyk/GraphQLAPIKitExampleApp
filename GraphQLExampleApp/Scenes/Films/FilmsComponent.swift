//  
//  FilmsComponent.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct FilmsComponent<Model: FilmsComponentModelProtocol>: View {
    @StateObject var model: Model

    var body: some View {
        Group {
            if let data = model.data {
                List {
                    Section("Filmy") {
                        ForEach(data.films, id: \.id) { film in
                            FilmView(film: film)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    model.tapped(on: film)
                                }
                        }
                    }

                    Section("Herci") {
                        ForEach(data.people, id: \.id, content: PersonView.init)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .task {
            await model.onAppear()
        }
    }
}

#if DEBUG
#Preview {
    FilmsComponent(
        model: FilmsComponentModelMock()
    )
}
#endif
