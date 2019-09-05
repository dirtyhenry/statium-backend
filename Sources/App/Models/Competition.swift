import FluentPostgreSQL
import Vapor

/// A single entry of a Competition list.
final class Competition: PostgreSQLModel {
    /// The unique identifier for this `Todo`.
    var id: Int?
    
    /// A title describing what this `Todo` entails.
    var title: String
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

/// Allows `Competition` to be used as a dynamic migration.
extension Competition: Migration { }

/// Allows `Competition` to be encoded to and decoded from HTTP messages.
extension Competition: Content { }

/// Allows `Competition` to be used as a dynamic parameter in route definitions.
extension Competition: Parameter { }
