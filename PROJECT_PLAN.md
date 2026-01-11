# iOS Science Widget - Project Plan

## Project Overview

Develop an iOS widget that displays one piece of science content every day on the phone's home screen. The widget will provide users with daily science facts, discoveries, or educational content.

## Technology Stack

- **WidgetKit** (iOS 14+) - Core widget framework
- **SwiftUI** - Widget UI implementation
- **Swift** - App logic and data management
- **Xcode** - Development environment
- **Cursor** - Primary development IDE

## Architecture

### Core Components

1. **Widget Extension**
   - The actual widget UI that appears on the home screen
   - SwiftUI-based view components
   - Supports multiple widget sizes (starting with small)

2. **Timeline Provider**
   - Manages widget update schedule
   - Schedules daily refreshes
   - Handles entry generation and caching

3. **Data Manager**
   - Fetches science content from APIs or generates via AI
   - Manages data caching and storage
   - Handles offline fallback scenarios

4. **Main App** (Optional)
   - Configuration and settings
   - Manual refresh controls
   - Widget preview/testing

## Data Source Strategy

### Option A: Free APIs (Recommended for MVP)

**Potential API Sources:**
- **NASA APOD (Astronomy Picture of the Day)**
  - Endpoint: `https://api.nasa.gov/planetary/apod`
  - Free API key required
  - Daily astronomy content with images

- **ScienceDaily RSS Feed**
  - RSS parsing required
  - Latest science news and discoveries

- **Wikipedia "On this day" API**
  - Historical science events
  - Free, no authentication needed

- **Custom JSON Endpoint**
  - Self-hosted or third-party science fact APIs

**Implementation Notes:**
- API calls should be made in background
- Cache responses for offline access
- Handle API failures gracefully
- Rate limiting considerations

### Option B: AI-Generated Content

**Approach:**
- Use AI API (OpenAI, Anthropic, etc.) to generate daily science facts
- Generate content on-demand or pre-generate batches
- Store generated content locally

**Considerations:**
- API costs and rate limits
- Content quality and fact-checking
- Network dependency
- Caching strategy for offline access

### Hybrid Approach (Future Enhancement)
- Primary: API-based content
- Fallback: AI-generated content when API fails
- Local cache for offline scenarios

## Widget Types & Design

### Phase 1: Small Widget (Initial Focus)

**Specifications:**
- Size: 2x2 grid cells (smallest iOS widget size)
- Content: One science fact with title
- Update frequency: Daily (at midnight or user-defined time)
- Design considerations:
  - Readable typography (system fonts recommended)
  - Dark mode support
  - Minimal, clean design
  - Optional: Small icon or emoji

**Layout Example:**
```
┌─────────────────┐
│  🔬 Science     │
│                 │
│  [Daily Fact]   │
│  [Text Content] │
│                 │
└─────────────────┘
```

### Phase 2: Medium Widget (Future)

- Size: 4x2 grid cells
- Content: Fact + image/illustration
- More detailed information

### Phase 3: Large Widget (Future)

- Size: 4x4 grid cells
- Content: Extended content, multiple facts
- Interactive elements (iOS 16+)

## Implementation Plan

### Phase 1: Foundation (Week 1)

1. **Project Setup**
   - Create Xcode project with Widget Extension
   - Configure app groups for data sharing
   - Set up basic project structure

2. **Basic Widget UI**
   - Implement small widget view
   - Create placeholder content
   - Test widget rendering

3. **Timeline Provider**
   - Set up daily update schedule
   - Implement basic entry generation
   - Test timeline refresh behavior

### Phase 2: Data Integration (Week 2)

1. **Data Manager Implementation**
   - Create data fetching service
   - Implement API client (or AI integration)
   - Add error handling and retry logic

2. **Caching System**
   - Local storage for fetched content
   - Cache invalidation strategy
   - Offline content support

3. **Widget Data Binding**
   - Connect Timeline Provider to Data Manager
   - Update widget with real content
   - Handle loading and error states

### Phase 3: Polish & Testing (Week 3)

1. **UI Refinement**
   - Dark mode optimization
   - Typography and spacing adjustments
   - Visual polish

2. **Testing**
   - Test on different iOS versions
   - Test widget refresh behavior
   - Test offline scenarios
   - Test API failure handling

3. **Documentation**
   - Code comments
   - Setup instructions
   - API key configuration guide

## Design Considerations

### Visual Design
- **Color Scheme**: Science-themed (blues, greens, or neutral)
- **Typography**: System fonts (San Francisco) for readability
- **Icons**: SF Symbols for consistency
- **Dark Mode**: Full support required

### User Experience
- **Loading States**: Show placeholder or last known content
- **Error Handling**: Graceful degradation
- **Accessibility**: VoiceOver support, Dynamic Type
- **Performance**: Fast rendering, minimal battery impact

### Technical Considerations
- **Background Refresh**: Efficient use of background tasks
- **Data Efficiency**: Minimize network calls
- **Battery Impact**: Optimize update frequency
- **Privacy**: No user data collection required

## Development Workflow

### File Structure (Proposed)
```
ScienceWidget/
├── ScienceWidget/
│   ├── ScienceWidgetApp.swift          # Main app entry
│   ├── ScienceWidgetBundle.swift       # Widget bundle
│   ├── Views/
│   │   ├── SmallWidgetView.swift       # Small widget UI
│   │   └── WidgetPlaceholderView.swift # Placeholder
│   ├── Providers/
│   │   ├── ScienceTimelineProvider.swift # Timeline logic
│   │   └── ScienceDataManager.swift    # Data fetching
│   ├── Models/
│   │   └── ScienceContent.swift        # Data models
│   └── Utilities/
│       ├── APIClient.swift             # API integration
│       └── CacheManager.swift          # Local storage
└── ScienceWidgetTests/
    └── ScienceWidgetTests.swift
```

## Next Steps

1. **Decide on Data Source**
   - Evaluate API options
   - Test API availability and content quality
   - Consider AI integration feasibility

2. **Set Up Development Environment**
   - Ensure Xcode is installed
   - Set up iOS development certificates (if needed)
   - Create new Xcode project

3. **Start Implementation**
   - Begin with Phase 1 tasks
   - Iterate based on testing and feedback

## Questions to Resolve

- [ ] Which API will be used? (NASA APOD, custom, or other)
- [ ] Will AI generation be integrated? If so, which service?
- [ ] What time should the widget update daily?
- [ ] Should there be a main app interface or widget-only?
- [ ] Any specific science topics to focus on? (astronomy, biology, physics, etc.)

## Resources

- [Apple WidgetKit Documentation](https://developer.apple.com/documentation/widgetkit)
- [SwiftUI Widgets Tutorial](https://developer.apple.com/tutorials/app-dev-training)
- [NASA APOD API](https://api.nasa.gov/)
- [SF Symbols](https://developer.apple.com/sf-symbols/)

---

**Last Updated**: Initial planning phase
**Status**: Planning → Ready for Implementation
