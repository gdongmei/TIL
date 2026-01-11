# Xcode Setup Guide

This guide will help you set up the Science Widget project in Xcode once it's installed.

## Prerequisites

- ✅ Xcode installed (latest version recommended)
- ✅ macOS with iOS development support
- ✅ Apple Developer account (free account works for simulator testing)

## Step 1: Create New Xcode Project

**Important**: Create the Xcode project **IN THIS DIRECTORY** (`/Users/gaod1/projects/TIL/`) so everything stays together for Git.

1. Open Xcode
2. Select **File → New → Project**
3. Choose **iOS → App**
4. Configure the project:
   - **Product Name**: `ScienceWidget`
   - **Team**: Select your team (or "None" for simulator only)
   - **Organization Identifier**: `com.til` (or your preferred identifier)
   - **Interface**: SwiftUI
   - **Language**: Swift
   - **Storage**: None (or Core Data if you want to add it later)
5. Click **Next**
6. **Navigate to `/Users/gaod1/projects/TIL/`** and click **Create**
   - This will create `ScienceWidget.xcodeproj` in the same directory as your Swift files
   - This makes Git workflow easier (see GIT_WORKFLOW.md)

## Step 2: Add Widget Extension

1. In Xcode, go to **File → New → Target**
2. Select **Widget Extension**
3. Configure:
   - **Product Name**: `ScienceWidgetExtension`
   - **Include Configuration Intent**: Unchecked (we're using StaticConfiguration)
   - **Language**: Swift
4. Click **Finish**
5. When prompted, click **Activate** for the scheme

## Step 3: Copy Swift Files

Copy all the prepared Swift files into your Xcode project:

### Option A: Drag and Drop (Recommended)

1. In Finder, navigate to `/Users/gaod1/projects/TIL/ScienceWidget/`
2. Drag the entire folder structure into Xcode's Project Navigator
3. Make sure **"Copy items if needed"** is checked
4. Select **"Create groups"** (not folder references)
5. Add to targets:
   - ✅ ScienceWidget (main app)
   - ✅ ScienceWidgetExtension (widget extension)

### Option B: Manual Copy

Copy files to these locations in your Xcode project:

**Main App Target:**
- `ScienceWidgetApp.swift` → Replace the default `App.swift`
- `Models/ScienceContent.swift`
- `Utilities/CacheManager.swift`
- `Utilities/APIClient.swift`
- `Providers/ScienceDataManager.swift`
- `Views/ContentView.swift` (from `ScienceWidgetApp.swift`)

**Widget Extension Target:**
- `ScienceWidgetBundle.swift` → Replace the default widget bundle
- `Providers/ScienceTimelineProvider.swift`
- `Views/SmallWidgetView.swift`
- `Views/WidgetPlaceholderView.swift`
- `Models/ScienceContent.swift`
- `Utilities/CacheManager.swift`
- `Utilities/APIClient.swift`
- `Providers/ScienceDataManager.swift`

## Step 4: Configure App Groups

To share data between the app and widget extension:

1. Select your **main app target** (ScienceWidget)
2. Go to **Signing & Capabilities** tab
3. Click **+ Capability**
4. Add **App Groups**
5. Create a new group: `group.com.til.sciencewidget` (or match the identifier in `CacheManager.swift`)
6. Repeat for the **widget extension target**

## Step 5: Update Info.plist (if needed)

The widget extension's `Info.plist` should already be configured, but verify:
- **NSExtension** → **NSExtensionPointIdentifier**: `com.apple.widgetkit-extension`

## Step 6: Build and Run

1. Select the **ScienceWidgetExtension** scheme
2. Choose a simulator (e.g., iPhone 15 Pro)
3. Click **Run** (⌘R)
4. The widget should appear in the simulator
5. To add it to home screen:
   - Long press on home screen
   - Tap the **+** button
   - Search for "Daily Science"
   - Add the widget

## Step 7: Configure API (Next Steps)

### For NASA APOD API:

1. Get a free API key from https://api.nasa.gov/
2. Open `APIClient.swift`
3. Update `fetchDailyScience()` method to use NASA API:
   ```swift
   return await fetchNASAAPOD(apiKey: "YOUR_API_KEY")
   ```

### For Custom API:

1. Update `fetchDailyScience()` in `APIClient.swift`
2. Implement your API endpoint
3. Map the response to `ScienceContent` model

### For AI Integration:

1. Add your AI service SDK
2. Implement `generateAIContent()` in `APIClient.swift`
3. Update `fetchDailyScience()` to call AI service

## Troubleshooting

### Build Errors

- **"Cannot find type 'ScienceContent'"**: Make sure all files are added to both targets
- **"App Groups not configured"**: Complete Step 4 above
- **Widget not appearing**: Make sure you're running the widget extension scheme, not the main app

### Widget Not Updating

- Widgets update on a schedule managed by iOS
- Force refresh: Remove and re-add the widget
- Check timeline policy in `ScienceTimelineProvider.swift`

### Cache Issues

- Clear app data: Delete app from simulator and reinstall
- Check App Groups identifier matches in both targets

## Testing

1. **Simulator Testing**: Run widget extension scheme
2. **Device Testing**: 
   - Connect iOS device
   - Select device in Xcode
   - Run widget extension
   - Widget will appear on device home screen

## Next Steps

- [ ] Choose and integrate data source (API or AI)
- [ ] Test widget refresh behavior
- [ ] Customize widget design
- [ ] Add medium/large widget sizes (optional)
- [ ] Add main app features (optional)

## File Structure Reference

```
ScienceWidget/
├── ScienceWidget/                    # Main app
│   ├── ScienceWidgetApp.swift
│   └── ContentView.swift
├── ScienceWidgetExtension/           # Widget extension
│   ├── ScienceWidgetBundle.swift
│   ├── Models/
│   │   └── ScienceContent.swift
│   ├── Providers/
│   │   ├── ScienceTimelineProvider.swift
│   │   └── ScienceDataManager.swift
│   ├── Views/
│   │   ├── SmallWidgetView.swift
│   │   └── WidgetPlaceholderView.swift
│   └── Utilities/
│       ├── APIClient.swift
│       └── CacheManager.swift
```

---

**Note**: The code is ready to use, but you'll need to configure your chosen data source in `APIClient.swift` before the widget will show real content.
