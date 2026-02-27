# Setup & Architecture Guide

This guide explains how the project is structured and how the app + widget work together. Use it as a **reference**, not a step‑by‑step tutorial.

## Targets & Schemes

- **App target**: `ScienceWidgetAppProject`
  - Scheme: `ScienceWidgetAppProject`
  - Entry: `ScienceWidgetApp.swift`
  - Main UI: `ContentView.swift`

- **Widget target**: `ScienceWidgetExtensionExtension`
  - Scheme: `ScienceWidgetExtensionExtension`
  - Bundle: `ScienceWidgetBundle.swift`
  - Timeline: `ScienceTimelineProvider.swift`
  - Views:
    - `SmallWidgetView` (small widget)
    - `MediumWidgetView` (medium widget)

## File Structure (high level)

- `ScienceWidgetAppProject/ScienceWidgetAppProject/`
  - `ScienceWidgetApp.swift` – `@main` app, shows `ContentView`
  - `ContentView.swift` – full‑screen view with daily science text + Refresh
  - `Models/ScienceContent.swift` – data model + placeholder/error helpers
  - `Providers/ScienceDataManager.swift` – fetch + cache orchestration
  - `Providers/ScienceTimelineProvider.swift` – WidgetKit timeline
  - `Utilities/APIClient.swift` – NASA APOD integration
  - `Utilities/CacheManager.swift` – shared UserDefaults (App Group) cache
  - `Views/SmallWidgetView.swift` – compact widget UI
  - `Views/MediumWidgetView.swift` – larger widget UI (more text)

- `ScienceWidgetAppProject/ScienceWidgetExtension/`
  - `Info.plist` – widget extension configuration
  - `Assets.xcassets` – widget icons and background color

## Data Flow

1. **Widget timeline** (`ScienceTimelineProvider`)
   - WidgetKit asks for a **timeline** of entries.
   - Provider calls `ScienceDataManager.shared.getTodaysContent()`.

2. **Data manager** (`ScienceDataManager`)
   - Uses `APIClient.fetchDailyScience()` to get NASA APOD (or fallback).
   - Uses `CacheManager` to reuse data within the same day.

3. **NASA integration** (`APIClient`)
   - Calls `https://api.nasa.gov/planetary/apod?api_key=YOUR_KEY`.
   - Maps the JSON response into `ScienceContent`.
   - Saves result into the shared cache.

4. **Widget views**
   - `ScienceWidgetBundle` creates `ScienceWidget`.
   - `ScienceWidgetEntryView` chooses:
     - `SmallWidgetView` for `.systemSmall`
     - `MediumWidgetView` for `.systemMedium`

5. **App view** (`ContentView`)
   - Uses the same `ScienceDataManager` to show the **same NASA entry**.
   - `Refresh` button clears cache and forces a refetch.

## Widget Sizes

- **Small widget**
  - Uses `SmallWidgetView`.
  - Shows header + truncated title + short body.

- **Medium widget**
  - Uses `MediumWidgetView`.
  - Shows header + longer title + more body text + optional source.

You can add more sizes later by extending `supportedFamilies` and `ScienceWidgetEntryView`.

## Common Issues & Fixes

- **"Cannot find 'MediumWidgetView' in scope"**
  - Make sure `MediumWidgetView.swift` is added to the project and its **Target Membership** includes `ScienceWidgetExtensionExtension`.

- **"Cannot find type 'ScienceContent'"**
  - Ensure `Models/ScienceContent.swift` is in both targets (app + widget).

- **Widget shows old placeholder text**
  - Remove the widget from the Home Screen, clean build, run widget scheme again, and re‑add the widget.

- **Xcode log: `Request widget family (systemMedium) is not supported`**
  - Ensure `supportedFamilies` in `ScienceWidgetBundle` includes `.systemMedium` (already configured).

- **Provisioning / signing errors on device**
  - For simulators: just set a Team; no device provisioning needed.
  - For physical devices: add the device to your Apple ID / Developer account.

## When to use which doc

- **QUICK_SETUP.md** – minimal steps to open, sign, and run the app + widget on a new machine.
- **SETUP_CHECKLIST.md** – quick checklist to confirm everything is configured.
- **SETUP_GUIDE.md** (this file) – reference for project structure, data flow, and common issues.

