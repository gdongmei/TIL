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
            SmallWidgetView(content: entry.content)
        }
        .configurationDisplayName("Daily Science")
        .description("Get a new science fact every day.")
        .supportedFamilies([.systemSmall])
    }
}
