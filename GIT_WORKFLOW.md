# Git Workflow Guide

## Quick Answer

**Push the code from Cursor (this directory) to GitHub.** The Swift source files in `/Users/gaod1/projects/TIL/ScienceWidget/` are your source of truth.

## Recommended Workflow

### Option 1: Xcode Project in Same Directory (Recommended)

**Best for:** Solo projects, keeping everything together

1. **Create Xcode project IN this directory** (`/Users/gaod1/projects/TIL/`)
   - When Xcode asks for location, choose `/Users/gaod1/projects/TIL/`
   - This creates `ScienceWidget.xcodeproj` in the same directory

2. **Copy Swift files from Cursor into Xcode** (as per SETUP_GUIDE.md)

3. **Commit everything together:**
   ```bash
   git add .
   git commit -m "Initial iOS widget project"
   git push
   ```
   
   This includes:
   - ✅ Swift source files (from Cursor)
   - ✅ Xcode project file (`.xcodeproj`)
   - ✅ Documentation files

**Advantages:**
- Everything in one place
- Easy to sync between Cursor and Xcode
- Simple Git workflow

### Option 2: Separate Directories (Alternative)

**Best for:** If you prefer keeping Xcode projects separate

1. **Keep Swift files in Cursor** (`/Users/gaod1/projects/TIL/`)
2. **Create Xcode project elsewhere** (e.g., `~/Desktop/ScienceWidget/`)
3. **Copy Swift files into Xcode project**
4. **When editing:**
   - Edit in Cursor → Copy to Xcode
   - OR edit in Xcode → Copy back to Cursor
5. **Push from Cursor directory** (source of truth)

**Advantages:**
- Clear separation
- Xcode project can be regenerated if needed

**Disadvantages:**
- Need to manually sync files
- More complex workflow

## Recommended: Option 1

For this project, **Option 1 is recommended** because:
- You're working solo
- Keeps everything organized
- Xcode project file is useful to have in Git
- Easy to work in both Cursor and Xcode

## What to Commit to GitHub

### ✅ Should Commit:
- All Swift source files (`.swift`)
- Xcode project file (`.xcodeproj`) - if using Option 1
- Documentation (`.md` files)
- `.gitignore` file

### ❌ Should NOT Commit (add to `.gitignore`):
- `DerivedData/` (build artifacts)
- `*.xcuserstate` (user-specific Xcode state)
- `*.xcworkspace/xcuserdata/` (user workspace data)
- `Pods/` (if using CocoaPods)
- `.swiftpm/` (Swift Package Manager cache)

## Creating .gitignore

Create a `.gitignore` file in your project root:

```gitignore
# Xcode
*.xcuserstate
*.xcworkspace/xcuserdata/
DerivedData/
*.hmap
*.ipa
*.dSYM.zip
*.dSYM

# Swift Package Manager
.build/
.swiftpm/
*.xcodeproj/project.xcworkspace/xcuserdata/

# CocoaPods
Pods/
*.xcworkspace

# macOS
.DS_Store
.AppleDouble
.LSOverride

# App-specific
*.plist
!Info.plist
```

## Workflow Summary

1. **Initial Setup:**
   - Code prepared in Cursor ✅ (already done)
   - Create Xcode project in same directory
   - Copy Swift files into Xcode
   - Initialize Git: `git init`
   - Create `.gitignore`
   - First commit: `git add . && git commit -m "Initial commit"`

2. **Daily Development:**
   - Edit code in **either** Cursor or Xcode
   - If editing in Xcode, the files are already in the repo
   - If editing in Cursor, make sure Xcode project references the same files
   - Commit changes: `git add . && git commit -m "Description"`
   - Push: `git push`

3. **Syncing Between Cursor and Xcode:**
   - If using Option 1: Files are the same, no syncing needed
   - If using Option 2: Manually copy files between directories

## Quick Start Commands

```bash
# Initialize Git (if not already done)
cd /Users/gaod1/projects/TIL
git init

# Create .gitignore (see above)
# Then commit everything
git add .
git commit -m "Initial iOS Science Widget project"

# Connect to GitHub (replace with your repo URL)
git remote add origin https://github.com/yourusername/science-widget.git
git branch -M main
git push -u origin main
```

---

**TL;DR**: Use Option 1, create Xcode project in the same directory, commit everything together. The Swift files in Cursor are your source code, and Xcode project file helps with building.
