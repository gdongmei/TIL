# Quick Start - Run the Science Widget Project

Use this when you (or someone else) clones the repo and just wants to run the existing app + widget.

## 1. Requirements

- Xcode 26+ installed
- Apple ID added in **Xcode → Settings → Accounts** (for signing)

## 2. Open the project

1. In Finder, go to `/Users/gaod1/projects/TIL/` (or your cloned repo path).
2. Open `ScienceWidgetAppProject/ScienceWidgetAppProject.xcodeproj` in Xcode.

## 3. Configure signing (one time per machine)

Do this for **both** targets:

1. In Xcode, select the blue project icon `ScienceWidgetAppProject` in the Project Navigator.
2. Under **TARGETS**, select:
   - `ScienceWidgetAppProject` (app)
   - `ScienceWidgetExtensionExtension` (widget)
3. For each target:
   - Go to **Signing & Capabilities**.
   - Set **Team** to your Personal Team / Apple ID.

> If you only use the simulator, you do **not** need to add a physical device.

## 4. Run the app (to see full text)

1. Select the **`ScienceWidgetAppProject`** scheme at the top.
2. Choose an iOS Simulator (e.g. *iPhone 16 Pro*).
3. Press **Run** (⌘R).
4. In the simulator, open the app:
   - You should see the **full NASA APOD title and explanation**.
   - Use the **Refresh** button to force a fresh fetch from NASA (and update the cache).

## 5. Run the widget extension

1. Change the scheme to **`ScienceWidgetExtensionExtension`**.
2. Keep the same simulator device selected.
3. Press **Run** (⌘R).
4. After build succeeds, go to the simulator Home Screen:
   - Long‑press on empty space → tap **+** → search for **"Daily Science"**.
   - Add the **Small** widget (shows compact text) or **Medium** widget (shows more text).

The widget will load the **same NASA APOD data** as the app (through `ScienceDataManager` and `APIClient`).

## 6. Configure NASA API key (if you change machines)

Your NASA key is stored in `APIClient.swift`:

- File: `ScienceWidgetAppProject/ScienceWidgetAppProject/Utilities/APIClient.swift`
- Line:

  ```swift
  private let nasaAPIKey = "..."
  ```

If you clone this repo on a new machine, update this line with your own key from `https://api.nasa.gov/`.

## 7. Where the important code lives

- App entry: `ScienceWidgetApp.swift`
- App UI (full text view): `ContentView.swift`
- Widget bundle + family switching: `ScienceWidgetBundle.swift`
- Widget views: `Views/SmallWidgetView.swift`, `Views/MediumWidgetView.swift`
- Timeline + data flow: `Providers/ScienceTimelineProvider.swift`, `Providers/ScienceDataManager.swift`
- Data model & caching: `Models/ScienceContent.swift`, `Utilities/CacheManager.swift`
- NASA integration: `Utilities/APIClient.swift`

For a deeper explanation of targets, architecture, and troubleshooting, see `SETUP_GUIDE.md`.

