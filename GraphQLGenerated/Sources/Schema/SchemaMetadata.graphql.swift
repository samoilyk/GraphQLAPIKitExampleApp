// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQLGenerated.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLGenerated.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQLGenerated.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLGenerated.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return GraphQLGenerated.Objects.Query
    case "FilmsConnection": return GraphQLGenerated.Objects.FilmsConnection
    case "Film": return GraphQLGenerated.Objects.Film
    case "Person": return GraphQLGenerated.Objects.Person
    case "Planet": return GraphQLGenerated.Objects.Planet
    case "Species": return GraphQLGenerated.Objects.Species
    case "Starship": return GraphQLGenerated.Objects.Starship
    case "Vehicle": return GraphQLGenerated.Objects.Vehicle
    case "FilmPlanetsConnection": return GraphQLGenerated.Objects.FilmPlanetsConnection
    case "PeopleConnection": return GraphQLGenerated.Objects.PeopleConnection
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
