import WidgetKit
import SwiftUI

/// Timeline provider for the science widget
struct ScienceTimelineProvider: TimelineProvider {
    typealias Entry = ScienceEntry
    
    let dataManager = ScienceDataManager.shared
    
    /// Placeholder entry for widget configuration
    func placeholder(in context: Context) -> ScienceEntry {
        ScienceEntry(
            date: Date(),
            content: ScienceContent.placeholder()
        )
    }
    
    /// Snapshot entry for widget previews
    func getSnapshot(in context: Context, completion: @escaping (ScienceEntry) -> Void) {
        let entry = ScienceEntry(
            date: Date(),
            content: ScienceContent.placeholder()
        )
        completion(entry)
    }
    
    /// Timeline entries for widget updates
    func getTimeline(in context: Context, completion: @escaping (Timeline<ScienceEntry>) -> Void) {
        Task {
            let content = await dataManager.getTodaysContent()
            let now = Date()
            
            // Create entry for today
            let entry = ScienceEntry(
                date: now,
                content: content
            )
            
            // Calculate next update time (midnight tomorrow)
            let calendar = Calendar.current
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: now)!
            let midnight = calendar.startOfDay(for: tomorrow)
            
            // Create timeline with entry and refresh policy
            let timeline = Timeline(entries: [entry], policy: .after(midnight))
            completion(timeline)
        }
    }
}

/// Widget entry containing science content
struct ScienceEntry: TimelineEntry {
    let date: Date
    let content: ScienceContent
}
