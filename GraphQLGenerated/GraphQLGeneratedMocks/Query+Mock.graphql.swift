// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLGenerated

public class Query: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLGenerated.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<FilmsConnection>("allFilms") public var allFilms
    @Field<PeopleConnection>("allPeople") public var allPeople
  }
}

public extension Mock where O == Query {
  convenience init(
    allFilms: Mock<FilmsConnection>? = nil,
    allPeople: Mock<PeopleConnection>? = nil
  ) {
    self.init()
    _setEntity(allFilms, for: \.allFilms)
    _setEntity(allPeople, for: \.allPeople)
  }
}
