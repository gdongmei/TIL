# Science Widget - Code Structure

This directory contains all the Swift source code for the iOS Science Widget project.

## File Organization

### Models
- **ScienceContent.swift**: Data model for science facts/content

### Views
- **SmallWidgetView.swift**: UI for the small widget (2x2 grid)
- **WidgetPlaceholderView.swift**: Placeholder view for widget configuration

### Providers
- **ScienceTimelineProvider.swift**: Manages widget timeline and updates
- **ScienceDataManager.swift**: Handles data fetching and caching logic

### Utilities
- **APIClient.swift**: API integration (ready for NASA APOD, custom APIs, or AI)
- **CacheManager.swift**: Local storage and caching system

### Main Files
- **ScienceWidgetBundle.swift**: Widget bundle configuration
- **ScienceWidgetApp.swift**: Main app entry point (optional)

## Integration Steps

See [../SETUP_GUIDE.md](../SETUP_GUIDE.md) for detailed Xcode setup instructions.

## Key Features

✅ **Small Widget Support**: 2x2 grid widget ready to use  
✅ **Daily Updates**: Automatic refresh at midnight  
✅ **Caching**: Offline support with local cache  
✅ **Error Handling**: Graceful fallbacks for API failures  
✅ **Dark Mode**: Automatic support via system colors  
✅ **Extensible**: Easy to add medium/large widgets later  

## Configuration Needed

Before the widget works with real data, you need to:

1. **Choose a data source** (API or AI)
2. **Update `APIClient.swift`**:
   - Implement `fetchDailyScience()` with your chosen source
   - Or use `fetchNASAAPOD()` if using NASA API
   - Or implement `generateAIContent()` for AI integration

## Current Status

- ✅ Core architecture complete
- ✅ Widget UI implemented
- ✅ Timeline provider ready
- ✅ Caching system in place
- ⏳ Data source integration (pending your choice)
