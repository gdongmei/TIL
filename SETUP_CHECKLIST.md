# Setup Checklist (Clone → Run)

Use this when setting up the project on a new Mac.

## Environment
- [ ] Xcode 26+ installed
- [ ] Apple ID added in **Xcode → Settings → Accounts**
- [ ] Repo cloned to your machine (e.g. `~/projects/TIL`)

## Open Project
- [ ] Open `ScienceWidgetAppProject/ScienceWidgetAppProject.xcodeproj` in Xcode

## Signing
- [ ] App target `ScienceWidgetAppProject` has a Team selected
- [ ] Widget target `ScienceWidgetExtensionExtension` has a Team selected

## NASA API
- [ ] Open `Utilities/APIClient.swift`
- [ ] `nasaAPIKey` set to a valid key from `https://api.nasa.gov/`

## Run & Test
- [ ] App scheme `ScienceWidgetAppProject` runs on an iOS Simulator
- [ ] App shows a NASA title + explanation
- [ ] Widget scheme `ScienceWidgetExtensionExtension` builds successfully
- [ ] Small widget added and shows NASA text
- [ ] Medium widget added and shows more of the same text
- [ ] Tapping the widget opens the app showing the same day's content

## Done
- [ ] Everything works without build errors

If you need more detail on any step, see `QUICK_SETUP.md` and `SETUP_GUIDE.md`.

