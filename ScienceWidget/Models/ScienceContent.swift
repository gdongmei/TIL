import Foundation

/// Model representing a daily science fact or content
struct ScienceContent: Codable, Identifiable {
    let id: String
    let title: String
    let content: String
    let date: Date
    let source: String?
    let imageURL: String?
    
    /// Creates a placeholder content for loading states
    static func placeholder() -> ScienceContent {
        ScienceContent(
            id: UUID().uuidString,
            title: "Loading...",
            content: "Fetching today's science fact...",
            date: Date(),
            source: nil,
            imageURL: nil
        )
    }
    
    /// Creates an error content for failure states
    static func error(message: String = "Unable to load content") -> ScienceContent {
        ScienceContent(
            id: UUID().uuidString,
            title: "Error",
            content: message,
            date: Date(),
            source: nil,
            imageURL: nil
        )
    }
}

/// Response wrapper for API calls
struct ScienceContentResponse: Codable {
    let content: ScienceContent
    let timestamp: Date
}
