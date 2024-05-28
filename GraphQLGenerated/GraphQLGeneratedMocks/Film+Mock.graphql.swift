// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLGenerated

public class Film: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLGenerated.Objects.Film
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Film>>

  public struct MockFields {
    @Field<String>("director") public var director
    @Field<GraphQLGenerated.ID>("id") public var id
    @Field<FilmPlanetsConnection>("planetConnection") public var planetConnection
    @Field<String>("releaseDate") public var releaseDate
    @Field<String>("title") public var title
  }
}

public extension Mock where O == Film {
  convenience init(
    director: String? = nil,
    id: GraphQLGenerated.ID? = nil,
    planetConnection: Mock<FilmPlanetsConnection>? = nil,
    releaseDate: String? = nil,
    title: String? = nil
  ) {
    self.init()
    _setScalar(director, for: \.director)
    _setScalar(id, for: \.id)
    _setEntity(planetConnection, for: \.planetConnection)
    _setScalar(releaseDate, for: \.releaseDate)
    _setScalar(title, for: \.title)
  }
}
