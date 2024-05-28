// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import GraphQLGenerated

public class Planet: MockObject {
  public static let objectType: ApolloAPI.Object = GraphQLGenerated.Objects.Planet
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Planet>>

  public struct MockFields {
    @Field<String>("gravity") public var gravity
    @Field<GraphQLGenerated.ID>("id") public var id
    @Field<String>("name") public var name
    @Field<Double>("population") public var population
  }
}

public extension Mock where O == Planet {
  convenience init(
    gravity: String? = nil,
    id: GraphQLGenerated.ID? = nil,
    name: String? = nil,
    population: Double? = nil
  ) {
    self.init()
    _setScalar(gravity, for: \.gravity)
    _setScalar(id, for: \.id)
    _setScalar(name, for: \.name)
    _setScalar(population, for: \.population)
  }
}
