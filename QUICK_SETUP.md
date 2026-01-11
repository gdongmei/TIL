# Quick Setup Guide - Option 1 (Xcode in Same Directory)

Follow these steps to set up your Xcode project in the same directory as your Swift code.

## Prerequisites Check

- ✅ Xcode installed (version 26.2 detected)
- ✅ Swift code prepared in `/Users/gaod1/projects/TIL/ScienceWidget/`
- ✅ Current directory: `/Users/gaod1/projects/TIL/`

## Step-by-Step Instructions

### Step 1: Open Xcode

1. Open **Xcode** from Applications or Spotlight
2. If you see a welcome screen, click **"Create a new Xcode project"**
   - OR go to **File → New → Project**

### Step 2: Create iOS App Project

1. In the template chooser:
   - Select **iOS** tab (top)
   - Choose **App** template
   - Click **Next**

2. Configure the project:
   - **Product Name**: `ScienceWidget`
   - **Team**: Select your team (or "None" for simulator only)
   - **Organization Identifier**: `com.til`
   - **Bundle Identifier**: Will auto-fill as `com.til.ScienceWidget`
   - **Interface**: **SwiftUI** ⚠️ (Important!)
   - **Language**: **Swift** ⚠️ (Important!)
   - **Storage**: **None**
   - **Include Tests**: ✅ (optional, but recommended)

3. Click **Next**

### Step 3: Choose Location (CRITICAL STEP)

1. In the file save dialog:
   - **Navigate to**: `/Users/gaod1/projects/TIL/`
   - **IMPORTANT**: Make sure you're saving IN the TIL directory, not creating a new folder
   - The path should show: `/Users/gaod1/projects/TIL/`
   - **Do NOT** create a new folder called "ScienceWidget" inside TIL
   - The project name in the dialog should be `ScienceWidget` but the location is `/Users/gaod1/projects/TIL/`

2. Click **Create**

3. **Verify**: After creation, you should see:
   - `/Users/gaod1/projects/TIL/ScienceWidget.xcodeproj` (new file)
   - `/Users/gaod1/projects/TIL/ScienceWidget/` (Xcode created this folder with default files)
   
   **Note**: Xcode will create a `ScienceWidget/` folder. Your prepared Swift code is also in a `ScienceWidget/` folder. They're the same folder! Xcode will add some default files (like `ScienceWidgetApp.swift`) which we'll replace with your prepared files.

### Step 4: Add Widget Extension Target

1. In Xcode, with your project open:
   - Click on the **ScienceWidget** project (blue icon) in the Project Navigator (left sidebar)
   - At the bottom of the targets list, click the **+** button
   - OR go to **File → New → Target**

2. In the template chooser:
   - Select **iOS** tab
   - Choose **Widget Extension**
   - Click **Next**

3. Configure the widget:
   - **Product Name**: `ScienceWidgetExtension`
   - **Include Configuration Intent**: ❌ **Unchecked** (we're using StaticConfiguration)
   - **Language**: **Swift**

4. Click **Finish**

5. When prompted: **Click "Activate"** to activate the scheme

### Step 5: Import Your Swift Files

Now we'll add your prepared Swift files to the Xcode project.

#### Option A: Add Existing Files (Recommended)

1. In **Xcode**, in the Project Navigator (left sidebar):
   - You'll see a `ScienceWidget` folder (Xcode created this)
   - Right-click on the **ScienceWidget** folder
   - Select **"Add Files to ScienceWidget..."**

2. In the file picker:
   - Navigate to `/Users/gaod1/projects/TIL/ScienceWidget/`
   - You'll see your prepared folders: `Models/`, `Views/`, `Providers/`, `Utilities/`
   - Select these folders:
     - `Models/` folder
     - `Views/` folder
     - `Providers/` folder
     - `Utilities/` folder
   - **IMPORTANT**: Check these options:
     - ❌ **"Copy items if needed"** (UNCHECK - files are already in the right place)
     - ✅ **"Create groups"** (not folder references)
     - ✅ **"Add to targets"**: 
       - ✅ ScienceWidget (main app)
       - ✅ ScienceWidgetExtension (widget extension)

3. Click **Add**

4. Now add the main Swift files:
   - Right-click on **ScienceWidget** folder again
   - **"Add Files to ScienceWidget..."**
   - Navigate to `/Users/gaod1/projects/TIL/ScienceWidget/`
   - Select: `ScienceWidgetApp.swift` and `ScienceWidgetBundle.swift`
   - Same options: Uncheck "Copy items", Create groups, Add to appropriate targets

#### Option B: Manual File Addition

If drag-and-drop doesn't work, add files one by one:

1. Right-click on **ScienceWidget** folder in Xcode
2. Select **"New Group"** and name it `Models`
3. Right-click on `Models` → **"Add Files to ScienceWidget..."**
4. Navigate to and select `ScienceWidget/Models/ScienceContent.swift`
5. Make sure both targets are checked
6. Repeat for other folders

### Step 6: Replace Default Files

1. **Replace Widget Bundle**:
   - In Xcode, find `ScienceWidgetExtension/ScienceWidgetBundle.swift` (Xcode created this)
   - Delete it (Move to Trash)
   - Add your `ScienceWidget/ScienceWidgetBundle.swift` to the widget extension target

2. **Replace Main App**:
   - In Xcode, find `ScienceWidget/ScienceWidgetApp.swift` (Xcode created this)
   - Delete it (Move to Trash)
   - Your `ScienceWidget/ScienceWidgetBundle.swift` should already be added

3. **Verify file targets**:
   - Select each Swift file in Project Navigator
   - In File Inspector (right panel), check **Target Membership**:
     - `ScienceWidgetApp.swift` → ✅ ScienceWidget only
     - `ScienceWidgetBundle.swift` → ✅ ScienceWidgetExtension only
     - `ScienceContent.swift` → ✅ Both targets
     - `CacheManager.swift` → ✅ Both targets
     - `APIClient.swift` → ✅ Both targets
     - `ScienceDataManager.swift` → ✅ Both targets
     - `ScienceTimelineProvider.swift` → ✅ ScienceWidgetExtension only
     - `SmallWidgetView.swift` → ✅ ScienceWidgetExtension only
     - `WidgetPlaceholderView.swift` → ✅ ScienceWidgetExtension only

### Step 7: Configure App Groups

1. Select **ScienceWidget** target (main app)
   - Click on project → Select **ScienceWidget** target
   - Go to **Signing & Capabilities** tab
   - Click **+ Capability**
   - Add **App Groups**
   - Click **+** next to App Groups
   - Enter: `group.com.til.sciencewidget`
   - Press Enter

2. Select **ScienceWidgetExtension** target
   - Repeat the same steps
   - Add the same App Group: `group.com.til.sciencewidget`

### Step 8: Build and Test

1. **Select Scheme**:
   - At the top of Xcode, next to the play button
   - Select **ScienceWidgetExtension** scheme (not ScienceWidget)

2. **Select Simulator**:
   - Next to the scheme, select an iPhone simulator (e.g., "iPhone 15 Pro")

3. **Build and Run**:
   - Click the **Play** button (⌘R)
   - Wait for build to complete
   - The widget should appear in the simulator

4. **Add Widget to Home Screen**:
   - In the simulator, go to home screen
   - Long press on empty space
   - Tap the **+** button (top left)
   - Search for "Daily Science"
   - Select the widget
   - Choose size (Small)
   - Tap **Add Widget**

## Verification Checklist

After setup, verify:

- [ ] `ScienceWidget.xcodeproj` exists in `/Users/gaod1/projects/TIL/`
- [ ] All Swift files are visible in Xcode Project Navigator
- [ ] Files have correct target membership
- [ ] App Groups configured for both targets
- [ ] Widget extension scheme builds successfully
- [ ] Widget appears in simulator

## Troubleshooting

### "Cannot find type 'ScienceContent'"
- **Fix**: Check that `ScienceContent.swift` is added to BOTH targets
- Select the file → File Inspector → Target Membership → Check both boxes

### "No such module 'WidgetKit'"
- **Fix**: Make sure you're building the Widget Extension target, not the main app

### Widget not appearing
- **Fix**: Make sure you selected `ScienceWidgetExtension` scheme before running

### Files showing in red
- **Fix**: Files aren't found. Re-add them using "Add Files to ScienceWidget..." and make sure "Copy items if needed" is unchecked if files are in the same directory

## Next Steps

Once setup is complete:
1. Configure your data source in `APIClient.swift`
2. Test the widget
3. Initialize Git: `git init && git add . && git commit -m "Initial commit"`
4. Push to GitHub

---

**Need help?** Check the detailed [SETUP_GUIDE.md](./SETUP_GUIDE.md) for more information.
