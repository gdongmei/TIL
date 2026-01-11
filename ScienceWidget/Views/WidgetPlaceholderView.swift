import SwiftUI
import WidgetKit

/// Placeholder view shown during widget configuration
struct WidgetPlaceholderView: View {
    var body: some View {
        SmallWidgetView(content: ScienceContent.placeholder())
            .redacted(reason: .placeholder)
    }
}
