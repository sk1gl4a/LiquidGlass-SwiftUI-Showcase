# Liquid Glass iOS 26 Showcase

[![Platform](https://img.shields.io/badge/iOS-26%2B-black?style=flat-square)](https://developer.apple.com/)
[![Xcode](https://img.shields.io/badge/Xcode-26%2B-black?style=flat-square)](https://developer.apple.com/xcode/)
[![Swift](https://img.shields.io/badge/Swift-6-orange?style=flat-square&logo=swift)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-white?style=flat-square)](LICENSE)

A **hands-on showcase** of every major Liquid Glass API introduced in **iOS 26 / WWDC 2025** — built in pure SwiftUI with no third-party dependencies.

---

## What's Inside

The app is structured as a menu of self-contained showcase screens, each demonstrating a distinct area of the Liquid Glass design language.

### Button Styles
Covers the full range of built-in glass button styles:

| API | Description |
|-----|-------------|
| `.buttonStyle(.glass)` | Standard translucent glass button |
| `.buttonStyle(.glassProminent)` | Filled, high-emphasis glass button |
| `.buttonStyle(.glass)` + `.tint()` | Tinted glass button |
| `.glassEffect(.clear.interactive())` | Raw glass effect on custom label |
| `.glassEffect(.regular.interactive())` | Regular (frosted) interactive glass |
| `.controlSize(.extraLarge)` | All control sizes supported |
| `GlassEffectContainer` | Groups buttons for optimised rendering |

### Controls
All standard SwiftUI controls adopt Liquid Glass automatically when built with the iOS 26 SDK:

- `Toggle` — glass knob on interaction
- `Slider` — glass scrubber and track
- `Stepper` — refreshed glass appearance
- `Picker` (segmented) — glass segments
- `Picker` (menu) — glass popover

### Custom Effects
Demonstrates the low-level glass primitives:

- **`glassEffectID` morphing** — glass shapes fluidly morph between states when views inside a `GlassEffectContainer` share matching IDs and are added/removed with `withAnimation`
- **`GlassEffectContainer`** — composites multiple effects into a single render pass for better performance and inter-element morphing
- **Effect style comparison** — `.clear`, `.regular`, `.clear.interactive()`, `.regular.interactive()` side by side

### Navigation
A full `TabView` using the iOS 26 tab-bar APIs:

- `.tabViewStyle(.sidebarAdaptable)` — tab bar that adapts to a sidebar on iPad
- `.tabBarMinimizeBehavior(.onScrollDown)` — tab bar auto-hides when scrolling
- `Tab(role: .search)` + `.searchable()` — search tab that transforms the tab bar into a live text field, matching Apple's design pattern

### Sheets & Modals
- `.sheet` with `.presentationDetents([.medium, .large])` — inset half-sheet with increased corner radius
- `.confirmationDialog` — action sheet originating from source element
- `.popover` — popover that auto-adopts a Liquid Glass background

---

## Key APIs Demonstrated

```swift
// Glass button styles
.buttonStyle(.glass)
.buttonStyle(.glassProminent)

// Raw glass effect on any view
.glassEffect(.regular)
.glassEffect(.clear.interactive())
.glassEffect(.regular, in: Circle())   // custom shape

// Grouping for performance and morphing
GlassEffectContainer(spacing: 12) { ... }

// Fluid glass morphing between states
.glassEffectID("my-id", in: namespace)

// iOS 26 tab bar
.tabViewStyle(.sidebarAdaptable)
.tabBarMinimizeBehavior(.onScrollDown)
Tab(role: .search) { ... }
.searchable(text: $query, prompt: "Search")
```

---

## Requirements

| Requirement | Version |
|-------------|---------|
| Xcode | 26 |
| iOS Deployment Target | 26.0 |
| Swift | 6 |

---

## Getting Started

```bash
git clone https://github.com/sk1gl4a/LiquidGlass-Showcase.git
cd LiquidGlass-Showcase
open LiquidGlassShowcase.xcodeproj
```

1. Select an **iOS 26 Simulator** (or connected device running iOS 26) as the run destination.
2. Press **⌘R** to build and run.

No package dependencies — it builds straight away.

---

## Project Structure

```
LiquidGlassShowcase/
├── LiquidGlassApp.swift          # App entry point
├── MainView.swift                # Root navigation menu
├── BackgroundView.swift          # Shared full-bleed background image
│
├── GlassButtonStylesView.swift   # Button Styles showcase
├── GlassControlsView.swift       # Controls showcase
├── CustomGlassEffectsView.swift  # glassEffectID + GlassEffectContainer
├── GlassNavigationView.swift     # TabView + search tab
└── GlassModalsView.swift         # Sheets, action sheets, popovers
```

---

## Navigation Architecture

The main menu uses `NavigationStack` with `NavigationPath` and type-safe `ShowcaseDestination` enum values. Every transition uses `.navigationTransition(.zoom(sourceID:in:))` — the zoom transition is sourced from the tapped button and expands into the destination screen, matching Apple's recommended pattern for Liquid Glass interfaces.

```swift
NavigationLink(value: item.destination) { ... }
    .buttonStyle(.glass)
    .matchedTransitionSource(id: item.destination, in: namespace)

// In navigationDestination:
DestinationView()
    .navigationTransition(.zoom(sourceID: destination, in: namespace))
```

---

## Resources

- [WWDC 2025 — Meet Liquid Glass](https://developer.apple.com/wwdc25/)
- [Human Interface Guidelines — Liquid Glass](https://developer.apple.com/design/human-interface-guidelines/)
- [SwiftUI Documentation — glassEffect](https://developer.apple.com/documentation/swiftui/view/glasseffect(_:in:))

---

## License

MIT — see [LICENSE](LICENSE) for details.
