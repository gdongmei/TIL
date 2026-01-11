import Foundation

/// Manages science content data fetching and caching
class ScienceDataManager {
    static let shared = ScienceDataManager()
    
    private let apiClient = APIClient.shared
    private let cacheManager = CacheManager.shared
    
    private init() {}
    
    /// Gets today's science content, using cache if available
    func getTodaysContent() async -> ScienceContent {
        // Check cache first
        if cacheManager.isCacheValid(), let cached = cacheManager.getCachedContent() {
            return cached
        }
        
        // Fetch new content
        if let content = await apiClient.fetchDailyScience() {
            return content
        }
        
        // If fetch fails, try to return cached content even if not today's
        if let cached = cacheManager.getCachedContent() {
            return cached
        }
        
        // Last resort: return error content
        return ScienceContent.error(message: "Unable to load science content. Please check your connection.")
    }
    
    /// Forces a refresh of today's content
    func refreshContent() async -> ScienceContent {
        cacheManager.clearCache()
        return await getTodaysContent()
    }
}
