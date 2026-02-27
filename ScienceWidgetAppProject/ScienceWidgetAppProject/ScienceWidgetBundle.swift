import WidgetKit
import SwiftUI

/// Widget bundle containing all widget configurations
@main
struct ScienceWidgetBundle: WidgetBundle {
    var body: some Widget {
        ScienceWidget()
    }
}

/// Main science widget
struct ScienceWidget: Widget {
    let kind: String = "ScienceWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ScienceTimelineProvider()) { entry in
            ScienceWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Daily Science")
        .description("Get a new science fact every day.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

/// Decides which layout to use based on widget family
struct ScienceWidgetEntryView: View {
    let entry: ScienceEntry
    @Environment(\.widgetFamily) private var family
    
    var body: some View {
        switch family {
        case .systemMedium:
            MediumWidgetView(content: entry.content)
        default:
            SmallWidgetView(content: entry.content)
        }
    }
}
