//
//  ContentView.swift
//  ScienceWidgetAppProject
//
//  Created by Dongmei Gao on 27.2.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var content: ScienceContent?
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading today's science fact...")
                } else if let content {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(content.title)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(content.content)
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            if let source = content.source {
                                Text("Source: \(source)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .padding(.top, 8)
                            }
                        }
                        .padding()
                    }
                } else if let errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    Text("No content available.")
                        .foregroundColor(.secondary)
                        .padding()
                }
            }
            .navigationTitle("Daily Science")
            .toolbar {
                Button("Refresh") {
                    Task {
                        await loadContent(forceRefresh: true)
                    }
                }
            }
            .task {
                await loadContent(forceRefresh: false)
            }
        }
    }
    
    private func loadContent(forceRefresh: Bool) async {
        isLoading = true
        errorMessage = nil
        if forceRefresh {
            content = await ScienceDataManager.shared.refreshContent()
        } else {
            content = await ScienceDataManager.shared.getTodaysContent()
        }
        isLoading = false
    }
}
