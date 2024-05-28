// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AllFilmsQuery: GraphQLQuery {
  public static let operationName: String = "AllFilms"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AllFilms { allFilms { __typename films { __typename title id releaseDate director planetConnection { __typename planets { __typename id name population gravity } } } } allPeople { __typename people { __typename id gender birthYear name skinColor } } }"#
    ))

  public init() {}

  public struct Data: GraphQLGenerated.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allFilms", AllFilms?.self),
      .field("allPeople", AllPeople?.self),
    ] }

    public var allFilms: AllFilms? { __data["allFilms"] }
    public var allPeople: AllPeople? { __data["allPeople"] }

    /// AllFilms
    ///
    /// Parent Type: `FilmsConnection`
    public struct AllFilms: GraphQLGenerated.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.FilmsConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("films", [Film?]?.self),
      ] }

      /// A list of all of the objects returned in the connection. This is a convenience
      /// field provided for quickly exploring the API; rather than querying for
      /// "{ edges { node } }" when no edge data is needed, this field can be be used
      /// instead. Note that when clients like Relay need to fetch the "cursor" field on
      /// the edge to enable efficient pagination, this shortcut cannot be used, and the
      /// full "{ edges { node } }" version should be used instead.
      public var films: [Film?]? { __data["films"] }

      /// AllFilms.Film
      ///
      /// Parent Type: `Film`
      public struct Film: GraphQLGenerated.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.Film }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("title", String?.self),
          .field("id", GraphQLGenerated.ID.self),
          .field("releaseDate", String?.self),
          .field("director", String?.self),
          .field("planetConnection", PlanetConnection?.self),
        ] }

        /// The title of this film.
        public var title: String? { __data["title"] }
        /// The ID of an object
        public var id: GraphQLGenerated.ID { __data["id"] }
        /// The ISO 8601 date format of film release at original creator country.
        public var releaseDate: String? { __data["releaseDate"] }
        /// The name of the director of this film.
        public var director: String? { __data["director"] }
        public var planetConnection: PlanetConnection? { __data["planetConnection"] }

        /// AllFilms.Film.PlanetConnection
        ///
        /// Parent Type: `FilmPlanetsConnection`
        public struct PlanetConnection: GraphQLGenerated.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.FilmPlanetsConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("planets", [Planet?]?.self),
          ] }

          /// A list of all of the objects returned in the connection. This is a convenience
          /// field provided for quickly exploring the API; rather than querying for
          /// "{ edges { node } }" when no edge data is needed, this field can be be used
          /// instead. Note that when clients like Relay need to fetch the "cursor" field on
          /// the edge to enable efficient pagination, this shortcut cannot be used, and the
          /// full "{ edges { node } }" version should be used instead.
          public var planets: [Planet?]? { __data["planets"] }

          /// AllFilms.Film.PlanetConnection.Planet
          ///
          /// Parent Type: `Planet`
          public struct Planet: GraphQLGenerated.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.Planet }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", GraphQLGenerated.ID.self),
              .field("name", String?.self),
              .field("population", Double?.self),
              .field("gravity", String?.self),
            ] }

            /// The ID of an object
            public var id: GraphQLGenerated.ID { __data["id"] }
            /// The name of this planet.
            public var name: String? { __data["name"] }
            /// The average population of sentient beings inhabiting this planet.
            public var population: Double? { __data["population"] }
            /// A number denoting the gravity of this planet, where "1" is normal or 1 standard
            /// G. "2" is twice or 2 standard Gs. "0.5" is half or 0.5 standard Gs.
            public var gravity: String? { __data["gravity"] }
          }
        }
      }
    }

    /// AllPeople
    ///
    /// Parent Type: `PeopleConnection`
    public struct AllPeople: GraphQLGenerated.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.PeopleConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("people", [Person?]?.self),
      ] }

      /// A list of all of the objects returned in the connection. This is a convenience
      /// field provided for quickly exploring the API; rather than querying for
      /// "{ edges { node } }" when no edge data is needed, this field can be be used
      /// instead. Note that when clients like Relay need to fetch the "cursor" field on
      /// the edge to enable efficient pagination, this shortcut cannot be used, and the
      /// full "{ edges { node } }" version should be used instead.
      public var people: [Person?]? { __data["people"] }

      /// AllPeople.Person
      ///
      /// Parent Type: `Person`
      public struct Person: GraphQLGenerated.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLGenerated.Objects.Person }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", GraphQLGenerated.ID.self),
          .field("gender", String?.self),
          .field("birthYear", String?.self),
          .field("name", String?.self),
          .field("skinColor", String?.self),
        ] }

        /// The ID of an object
        public var id: GraphQLGenerated.ID { __data["id"] }
        /// The gender of this person. Either "Male", "Female" or "unknown",
        /// "n/a" if the person does not have a gender.
        public var gender: String? { __data["gender"] }
        /// The birth year of the person, using the in-universe standard of BBY or ABY -
        /// Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is
        /// a battle that occurs at the end of Star Wars episode IV: A New Hope.
        public var birthYear: String? { __data["birthYear"] }
        /// The name of this person.
        public var name: String? { __data["name"] }
        /// The skin color of this person.
        public var skinColor: String? { __data["skinColor"] }
      }
    }
  }
}
