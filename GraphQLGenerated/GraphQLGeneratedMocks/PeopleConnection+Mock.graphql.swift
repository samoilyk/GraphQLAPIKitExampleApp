// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLGenerated

public class PeopleConnection: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLGenerated.Objects.PeopleConnection
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<PeopleConnection>>

  public struct MockFields {
    @Field<[Person?]>("people") public var people
  }
}

public extension Mock where O == PeopleConnection {
  convenience init(
    people: [Mock<Person>?]? = nil
  ) {
    self.init()
    _setList(people, for: \.people)
  }
}
