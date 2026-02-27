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
   - SwiftUI-based view components (`SmallWidgetView`, `MediumWidgetView`)
   - Currently supports **small** and **medium** widget sizes

2. **Timeline Provider**
   - Manages widget update schedule
   - Schedules daily refreshes
   - Handles entry generation and caching

3. **Data Manager**
   - Fetches science content from the NASA APOD API
   - Manages shared caching and storage for app + widget
   - Handles offline / failure fallback scenarios

4. **Main App**
   - Shows the **same daily NASA content** as the widget
   - Provides a **Refresh** action to force a new fetch and update cache
   - Useful for reading the full APOD explanation beyond widget truncation

## Data Source Strategy

### Option A: Free APIs (**Chosen for MVP**)

**Current API Source (Implemented):**
- **NASA APOD (Astronomy Picture of the Day)**
  - Endpoint: `https://api.nasa.gov/planetary/apod`
  - Uses a personal API key
  - Provides daily astronomy content with title, explanation, and optional image URL

**Other possible sources (Future):**
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

### Phase 1: Small Widget (Implemented)

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

### Phase 2: Medium Widget (Implemented)

- Size: 4x2 grid cells
- Content: Same daily NASA fact with more visible text
- Layout optimized for reading a longer portion of the explanation

### Phase 3: Large Widget (Future)

- Size: 4x4 grid cells
- Content: Extended content, multiple facts
- Interactive elements (iOS 16+)

## Implementation Plan

### Phase 1: Foundation

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

### Phase 2: Data Integration

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

### Phase 3: Polish & Testing

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

### File Structure (Current)
```
ScienceWidgetAppProject/
├── ScienceWidgetAppProject/                # Main app + shared code
│   ├── ScienceWidgetApp.swift              # Main app entry
│   ├── ContentView.swift                   # Full-screen daily science view
│   ├── ScienceWidgetBundle.swift           # Widget bundle + family switching
│   ├── Views/
│   │   ├── SmallWidgetView.swift           # Small widget UI
│   │   ├── MediumWidgetView.swift          # Medium widget UI
│   │   └── WidgetPlaceholderView.swift     # Placeholder (WidgetKit)
│   ├── Providers/
│   │   ├── ScienceTimelineProvider.swift   # Timeline logic
│   │   └── ScienceDataManager.swift        # Data fetching + caching
│   ├── Models/
│   │   └── ScienceContent.swift            # Data model
│   └── Utilities/
│       ├── APIClient.swift                 # NASA APOD integration
│       └── CacheManager.swift              # Shared local storage
├── ScienceWidgetExtension/                 # Widget extension bundle
│   ├── Info.plist
│   └── Assets.xcassets
└── ScienceWidgetAppProject.xcodeproj
```

## Next Steps

1. **Polish & UX**
   - Tune typography and truncation for small vs medium widgets
   - Consider adding image support from NASA APOD URLs

2. **Reliability**
   - Improve error messaging when NASA is unreachable
   - Add lightweight logging/metrics if needed

3. **Future Enhancements**
   - Explore additional APIs or AI-generated fallback content
   - Add larger widget size or interactive elements (iOS 16+)

## Questions to Resolve

- [ ] Will AI generation be integrated as a fallback? If so, which service?
- [ ] Should the widget support configurable topics (astronomy-only vs broader science)?
- [ ] Do we need user-configurable update time vs fixed daily schedule?

## Resources

- [Apple WidgetKit Documentation](https://developer.apple.com/documentation/widgetkit)
- [SwiftUI Widgets Tutorial](https://developer.apple.com/tutorials/app-dev-training)
- [NASA APOD API](https://api.nasa.gov/)
- [SF Symbols](https://developer.apple.com/sf-symbols/)

---

**Last Updated**: After initial implementation (small + medium widgets, NASA integration, shared app view)
**Status**: Core MVP implemented → Polish & enhancement phase
