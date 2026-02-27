import Foundation

/// API client for fetching science content
class APIClient {
    static let shared = APIClient()
    
    private let session: URLSession
    private let cacheManager = CacheManager.shared
    /// Replace this with your real NASA API key from https://api.nasa.gov/
    private let nasaAPIKey = "95yeB369e0eRo70gTvL4He23e2f9VvOwuG4stzN4"
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 30
        self.session = URLSession(configuration: configuration)
    }
    
    /// Fetches today's science content
    /// - Returns: ScienceContent or nil if fetch fails
    func fetchDailyScience() async -> ScienceContent? {
        // Check cache first
        if cacheManager.isCacheValid(), let cached = cacheManager.getCachedContent() {
            return cached
        }
        
        // If NASA API key is configured, try to fetch real APOD content
        if nasaAPIKey != "YOUR_NASA_API_KEY_HERE",
           let nasaContent = await fetchNASAAPOD(apiKey: nasaAPIKey) {
            return nasaContent
        }
        
        // Fallback: return a sample content if API key is missing or request fails
        let sampleContent = ScienceContent(
               id: UUID().uuidString,
               title: "NASA FALLBACK",
               content: "NASA request failed or key invalid.",
               date: Date(),
               source: "Sample",
               imageURL: nil
           )
        
        cacheManager.saveContent(sampleContent)
        return sampleContent
    }
    
    /// Fetches content from NASA APOD API
    /// - Parameter apiKey: NASA API key (get from https://api.nasa.gov/)
    func fetchNASAAPOD(apiKey: String) async -> ScienceContent? {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)") else {
            return nil
        }
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            // NASA APOD response structure
            struct NASAAPODResponse: Codable {
                let title: String
                let explanation: String
                let date: String
                let url: String?
                let hdurl: String?
            }
            
            let nasaResponse = try decoder.decode(NASAAPODResponse.self, from: data)
            
            let content = ScienceContent(
                id: nasaResponse.date,
                title: nasaResponse.title,
                content: nasaResponse.explanation,
                date: ISO8601DateFormatter().date(from: nasaResponse.date) ?? Date(),
                source: "NASA APOD",
                imageURL: nasaResponse.hdurl ?? nasaResponse.url
            )
            
            cacheManager.saveContent(content)
            return content
            
        } catch {
            print("Error fetching NASA APOD: \(error)")
            return nil
        }
    }
    
    /// Generates AI content (placeholder for AI integration)
    /// - Parameter prompt: The prompt for AI generation
    func generateAIContent(prompt: String) async -> ScienceContent? {
        // TODO: Integrate with AI service (OpenAI, Anthropic, etc.)
        // This is a placeholder for future AI integration
        
        return nil
    }
}
