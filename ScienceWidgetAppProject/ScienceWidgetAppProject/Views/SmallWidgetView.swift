import SwiftUI
import WidgetKit

/// Small widget view (2x2 grid cells)
struct SmallWidgetView: View {
    let content: ScienceContent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Header
            HStack {
                Image(systemName: "atom")
                    .font(.system(size: 12))
                    .foregroundColor(.blue)
                Text("Science")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
                Spacer()
            }
            
            Spacer()
            
            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(content.title)
                    .font(.system(size: 14, weight: .bold))
                    .lineLimit(2)
                    .foregroundColor(.primary)
                
                Text(content.content)
                    .font(.system(size: 11))
                    .lineLimit(3)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
    }
}

/// Preview for development
struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(content: ScienceContent(
            id: "1",
            title: "The Speed of Light",
            content: "Light travels at approximately 299,792,458 meters per second in a vacuum. This constant, denoted as 'c', is fundamental to Einstein's theory of relativity.",
            date: Date(),
            source: "Physics",
            imageURL: nil
        ))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
