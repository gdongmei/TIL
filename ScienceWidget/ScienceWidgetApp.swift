import SwiftUI

/// Main app entry point (optional - widget can work standalone)
@main
struct ScienceWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/// Main app content view (for future app features)
struct ContentView: View {
    @State private var content: ScienceContent?
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                } else if let content = content {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(content.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(content.content)
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        if let source = content.source {
                            Text("Source: \(source)")
                                .font(.caption)
                                .foregroundColor(.tertiary)
                        }
                    }
                    .padding()
                } else {
                    Text("No content available")
                        .foregroundColor(.secondary)
                }
                
                Button("Refresh") {
                    Task {
                        isLoading = true
                        content = await ScienceDataManager.shared.refreshContent()
                        isLoading = false
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Daily Science")
            .task {
                isLoading = true
                content = await ScienceDataManager.shared.getTodaysContent()
                isLoading = false
            }
        }
    }
}
