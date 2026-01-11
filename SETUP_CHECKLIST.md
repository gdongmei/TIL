# Setup Checklist - Follow Along

Use this checklist as you go through the Xcode setup process.

## Pre-Setup
- [ ] Xcode is installed ✅ (Detected: version 26.2)
- [ ] Current directory: `/Users/gaod1/projects/TIL/`
- [ ] Swift code is prepared in `ScienceWidget/` folder

## Step 1: Create Xcode Project
- [ ] Opened Xcode
- [ ] Created new iOS App project
- [ ] Named it `ScienceWidget`
- [ ] Set Organization Identifier: `com.til`
- [ ] Selected SwiftUI interface
- [ ] Selected Swift language
- [ ] **Saved project in `/Users/gaod1/projects/TIL/`** (not in a subfolder!)
- [ ] Verified `ScienceWidget.xcodeproj` exists in TIL directory

## Step 2: Add Widget Extension
- [ ] Added Widget Extension target
- [ ] Named it `ScienceWidgetExtension`
- [ ] Unchecked "Include Configuration Intent"
- [ ] Activated the scheme

## Step 3: Add Swift Files to Xcode
- [ ] Added `Models/` folder to project
- [ ] Added `Views/` folder to project
- [ ] Added `Providers/` folder to project
- [ ] Added `Utilities/` folder to project
- [ ] Added `ScienceWidgetApp.swift` to project
- [ ] Added `ScienceWidgetBundle.swift` to project
- [ ] Verified files show in Project Navigator (not in red)

## Step 4: Configure Target Membership
- [ ] `ScienceContent.swift` → Both targets ✅
- [ ] `CacheManager.swift` → Both targets ✅
- [ ] `APIClient.swift` → Both targets ✅
- [ ] `ScienceDataManager.swift` → Both targets ✅
- [ ] `ScienceWidgetApp.swift` → ScienceWidget only ✅
- [ ] `ScienceWidgetBundle.swift` → ScienceWidgetExtension only ✅
- [ ] `ScienceTimelineProvider.swift` → ScienceWidgetExtension only ✅
- [ ] `SmallWidgetView.swift` → ScienceWidgetExtension only ✅
- [ ] `WidgetPlaceholderView.swift` → ScienceWidgetExtension only ✅

## Step 5: Replace Default Files
- [ ] Deleted Xcode's default `ScienceWidgetApp.swift`
- [ ] Deleted Xcode's default widget bundle file (if it created one)
- [ ] Verified your files are being used

## Step 6: Configure App Groups
- [ ] Added App Groups capability to ScienceWidget target
- [ ] Created App Group: `group.com.til.sciencewidget`
- [ ] Added same App Group to ScienceWidgetExtension target

## Step 7: Build and Test
- [ ] Selected `ScienceWidgetExtension` scheme
- [ ] Selected iPhone simulator
- [ ] Built project (⌘B) - no errors
- [ ] Ran widget extension (⌘R)
- [ ] Widget appeared in simulator
- [ ] Added widget to home screen

## Post-Setup
- [ ] Widget displays content (even if placeholder)
- [ ] No build errors
- [ ] Ready to configure data source

## Next Steps
- [ ] Review `APIClient.swift` for data source integration
- [ ] Choose API or AI data source
- [ ] Initialize Git repository
- [ ] First commit

---

**Stuck on a step?** Refer to [QUICK_SETUP.md](./QUICK_SETUP.md) for detailed instructions.
