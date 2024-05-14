//  
//  FilmsComponent.swift
//  GraphQLExampleApp
//
//  Created by Ievgen Samoilyk on 14.05.2024.
//

import SwiftUI

struct FilmsComponent<Model: ExampleComponentModelProtocol>: View {
    @StateObject var model: Model

    var body: some View {
        Group {
            if let films = model.films {
                List {
                    ForEach(films, id: \.id) { film in
                        FilmView(film: film)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                model.tapped(on: film)
                            }
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
