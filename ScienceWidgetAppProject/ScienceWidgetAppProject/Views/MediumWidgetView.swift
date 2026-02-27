import SwiftUI
import WidgetKit

/// Medium widget view (wider layout to show more text)
struct MediumWidgetView: View {
    let content: ScienceContent
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                // Header
                HStack {
                    Image(systemName: "atom")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                    Text("Science")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                // Title
                Text(content.title)
                    .font(.system(size: 16, weight: .bold))
                    .lineLimit(2)
                    .foregroundColor(.primary)
                
                // Body text – allow more lines than small widget
                Text(content.content)
                    .font(.system(size: 12))
                    .lineLimit(6)
                    .foregroundColor(.secondary)
                
                if let source = content.source {
                    Text(source)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(14)
        .background(Color(.systemBackground))
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(content: ScienceContent(
            id: "1",
            title: "The Speed of Light",
            content: "Light travels at approximately 299,792,458 meters per second in a vacuum. This constant, denoted as 'c', is fundamental to Einstein's theory of relativity.",
            date: Date(),
            source: "Physics",
            imageURL: nil
        ))
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

