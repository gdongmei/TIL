import Foundation

/// Manages local caching of science content
class CacheManager {
    static let shared = CacheManager()
    
    private let cacheKey = "science_content_cache"
    private let dateKey = "science_content_date"
    private let userDefaults = UserDefaults(suiteName: "group.com.til.sciencewidget")
    
    private init() {}
    
    /// Saves science content to cache
    func saveContent(_ content: ScienceContent) {
        guard let userDefaults = userDefaults else { return }
        
        if let encoded = try? JSONEncoder().encode(content) {
            userDefaults.set(encoded, forKey: cacheKey)
            userDefaults.set(Date(), forKey: dateKey)
        }
    }
    
    /// Retrieves cached science content
    func getCachedContent() -> ScienceContent? {
        guard let userDefaults = userDefaults,
              let data = userDefaults.data(forKey: cacheKey),
              let content = try? JSONDecoder().decode(ScienceContent.self, from: data) else {
            return nil
        }
        return content
    }
    
    /// Checks if cached content is still valid for today
    func isCacheValid() -> Bool {
        guard let userDefaults = userDefaults,
              let cachedDate = userDefaults.object(forKey: dateKey) as? Date else {
            return false
        }
        
        let calendar = Calendar.current
        return calendar.isDateInToday(cachedDate)
    }
    
    /// Clears the cache
    func clearCache() {
        userDefaults?.removeObject(forKey: cacheKey)
        userDefaults?.removeObject(forKey: dateKey)
    }
}
