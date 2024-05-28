// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLGenerated

public class Person: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLGenerated.Objects.Person
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Person>>

  public struct MockFields {
    @Field<String>("birthYear") public var birthYear
    @Field<String>("gender") public var gender
    @Field<GraphQLGenerated.ID>("id") public var id
    @Field<String>("name") public var name
    @Field<String>("skinColor") public var skinColor
  }
}

public extension Mock where O == Person {
  convenience init(
    birthYear: String? = nil,
    gender: String? = nil,
    id: GraphQLGenerated.ID? = nil,
    name: String? = nil,
    skinColor: String? = nil
  ) {
    self.init()
    _setScalar(birthYear, for: \.birthYear)
    _setScalar(gender, for: \.gender)
    _setScalar(id, for: \.id)
    _setScalar(name, for: \.name)
    _setScalar(skinColor, for: \.skinColor)
  }
}
