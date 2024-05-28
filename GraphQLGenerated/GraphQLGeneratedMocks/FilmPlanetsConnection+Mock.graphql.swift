// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLGenerated

public class FilmPlanetsConnection: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLGenerated.Objects.FilmPlanetsConnection
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<FilmPlanetsConnection>>

  public struct MockFields {
    @Field<[Planet?]>("planets") public var planets
  }
}

public extension Mock where O == FilmPlanetsConnection {
  convenience init(
    planets: [Mock<Planet>?]? = nil
  ) {
    self.init()
    _setList(planets, for: \.planets)
  }
}
