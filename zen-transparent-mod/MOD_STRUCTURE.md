# Zen Transparent Glass - Mod Structure

## Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    ZEN TRANSPARENT GLASS MOD                     │
│                      (Complete Structure)                        │
└─────────────────────────────────────────────────────────────────┘
```

## File Architecture

```
zen-transparent-glass/
│
├── 📄 theme.json              # Mod metadata & configuration
│   ├── id, name, description
│   ├── author, version, tags
│   └── URLs to all resources
│
├── 🎨 chrome.css              # Main styling (607 lines)
│   ├── Root variables
│   ├── Main browser transparency
│   ├── Sidebar styling
│   ├── URL bar glass effect
│   ├── Toolbar transparency
│   ├── Context menus & popups
│   ├── Workspace buttons
│   ├── Pinned tabs styling
│   ├── Find bar styling
│   ├── Status panel
│   ├── Custom scrollbar
│   ├── Compact mode
│   ├── Notifications
│   ├── Linux-specific fixes
│   ├── Accent colors (8 options)
│   ├── Animation settings
│   ├── Border radius options
│   ├── Opacity levels
│   └── UI enhancements
│
├── ⚙️ preferences.json         # Customization options (192 lines)
│   ├── 27 toggle/checkbox options
│   ├── 4 dropdown selectors
│   ├── 1 string input (blur amount)
│   └── OS-specific disabling
│
├── 📖 README.md               # Main documentation (408 lines)
│   ├── Features overview
│   ├── Installation guide
│   ├── Linux setup (KDE, GNOME, Hyprland, etc.)
│   ├── Customization options table
│   ├── Troubleshooting
│   └── Advanced configuration
│
├── 🐧 LINUX_GUIDE.md          # Linux-specific guide (626 lines)
│   ├── Quick reference table
│   ├── KDE Plasma setup
│   ├── GNOME setup
│   ├── Hyprland setup
│   ├── Sway setup
│   ├── i3 + picom setup
│   ├── dwm setup
│   ├── AwesomeWM setup
│   ├── XFCE setup
│   ├── Cinnamon setup
│   ├── Environment variables
│   ├── Testing script
│   └── Common issues & solutions
│
├── 🚀 QUICK_START.md          # Quick reference (68 lines)
│   ├── 5-minute setup
│   ├── Linux quick commands
│   ├── Customization at a glance
│   └── Troubleshooting checklist
│
├── 📋 SUBMISSION.md           # Store submission guide (103 lines)
│   ├── Submission template
│   ├── Form fields
│   └── Requirements checklist
│
└── 🖼️ preview.png             # Preview image (600x400)
    └── Visual showcase of theme
```

## CSS Architecture

```
chrome.css
│
├─ Section 1:  Root Variables & Base Transparency
├─ Section 2:  Main Browser Transparency
├─ Section 3:  Sidebar Transparency
├─ Section 4:  URL Bar Transparency
├─ Section 5:  Toolbar Transparency
├─ Section 6:  Context Menus & Popups
├─ Section 7:  Workspace Buttons
├─ Section 8:  Essentials & Pinned Tabs
├─ Section 9:  Find Bar Styling
├─ Section 10: Status Panel
├─ Section 11: Scrollbar Styling
├─ Section 12: Compact Mode Enhancements
├─ Section 13: Notifications & Toasts
├─ Section 14: Linux-Specific Fixes
├─ Section 15: Accent Color Customization (8 colors)
├─ Section 16: Animation Settings (4 speeds)
├─ Section 17: Border Radius Customization
├─ Section 18: Opacity Levels (3 levels)
├─ Section 19: Additional UI Enhancements
├─ Section 20: Dark/Light Mode Adaptations
├─ Section 21: Hide Elements Options
├─ Section 22: Tab Text Styling
├─ Section 23: Loading Indicator
├─ Section 24: Hover Effects
└─ Section 25: Fallbacks & Resets
```

## Preferences Structure

```
preferences.json
│
├─ Main Settings (3)
│  ├─ Enable transparency (checkbox)
│  ├─ Linux fixes (checkbox, Linux-only)
│  └─ Blur amount (string)
│
├─ Appearance (4)
│  ├─ Accent color (dropdown, 8 options)
│  ├─ Opacity level (dropdown, 3 options)
│  ├─ Border radius (dropdown, 3 options)
│  └─ Animation speed (dropdown, 4 options)
│
├─ UI Elements (9)
│  ├─ Sidebar transparency
│  ├─ URL bar transparency
│  ├─ Toolbar transparency
│  ├─ Glass menus
│  ├─ Workspace style
│  ├─ Pinned tab style
│  ├─ Find bar style
│  ├─ Status panel
│  └─ Custom scrollbar
│
├─ Effects (4)
│  ├─ Compact hover
│  ├─ Notifications
│  ├─ Custom border radius
│  ├─ Remove borders
│  ├─ Shadow effects
│  ├─ Hover effects
│  └─ Custom loading
│
└─ Visibility (3)
   ├─ Hide workspace indicator
   ├─ Hide new tab button
   └─ Hide close buttons
```

## Linux Support Matrix

```
┌──────────────────┬─────────────┬──────────────┬─────────────┐
│ Environment      │ Tool        │ Difficulty   │ Status      │
├──────────────────┼─────────────┼──────────────┼─────────────┤
│ KDE Plasma       │ kwin-blur   │ Easy         │ ✅ Best     │
│ GNOME            │ Blur Shell  │ Easy         │ ⚠️ Exp.     │
│ Hyprland         │ Built-in    │ Easy         │ ✅ Native   │
│ Sway             │ Built-in    │ Medium       │ ⚠️ No blur  │
│ i3 + picom       │ picom       │ Medium       │ ✅ Good     │
│ dwm              │ picom       │ Medium       │ ✅ Good     │
│ AwesomeWM        │ picom/Lua   │ Medium       │ ✅ Good     │
│ XFCE             │ picom       │ Hard         │ ⚠️ Limited  │
│ Cinnamon         │ Built-in    │ Hard         │ ⚠️ Limited  │
└──────────────────┴─────────────┴──────────────┴─────────────┘
```

## CSS Variable Hierarchy

```
:root
│
├─ --zen-transparent-bg         # Transparent background
├─ --zen-transparent-color      # Transparent color value
├─ --zen-transparency-opacity   # Main opacity (0.85 default)
├─ --zen-sidebar-opacity        # Sidebar opacity (0.9 default)
├─ --zen-tab-opacity            # Tab opacity (0.8 default)
├─ --zen-glass-animation        # Animation timing
├─ --zen-glass-accent           # Accent color
├─ --zen-glass-accent-rgb       # Accent RGB values
└─ --zen-glass-border-radius    # Border radius
```

## Media Query Usage

```
@-moz-pref() Queries:
│
├─ mod.zenglass.enable_transparency
├─ mod.zenglass.linux_fixes
├─ mod.zenglass.sidebar_transparency
├─ mod.zenglass.urlbar_transparency
├─ mod.zenglass.toolbar_transparency
├─ mod.zenglass.glass_menus
├─ mod.zenglass.workspace_style
├─ mod.zenglass.pinned_tab_style
├─ mod.zenglass.findbar_style
├─ mod.zenglass.status_panel
├─ mod.zenglass.custom_scrollbar
├─ mod.zenglass.compact_hover
├─ mod.zenglass.notifications
├─ mod.zenglass.custom_border_radius
├─ mod.zenglass.remove_borders
├─ mod.zenglass.shadow_effects
├─ mod.zenglass.hide_workspace_indicator
├─ mod.zenglass.hide_newtab_button
├─ mod.zenglass.hide_close_buttons
├─ mod.zenglass.tab_text_style
├─ mod.zenglass.custom_loading
└─ mod.zenglass.hover_effects
```

## :has() Selectors for Preferences

```
:root:has([mod-zenglass-*]) Selectors:
│
├─ accent-color: purple, blue, green, red, orange, pink, cyan, white
├─ animation-speed: none, fast, normal, slow
├─ border-radius: small, medium, large
└─ opacity: light, medium, heavy
```

## Installation Flow

```
User Action                      Result
─────────────────────────────────────────────────────────
1. Install mod from store        → Mod downloaded
2. Enable in Settings            → CSS applied
3. Configure about:config        → Flags enabled
4. Configure mod settings        → Preferences saved
5. Restart browser               → Full effect applied

Linux Additional:
6. Install blur tool             → Compositor ready
7. Configure window rules        → Blur applied
8. Restart Zen                   → Full transparency
```

## Statistics

```
Total Files:        7
Total Lines:        ~2,019
CSS Lines:          607
Preference Options: 27
Accent Colors:      8
Animation Speeds:   4
Opacity Levels:     3
Border Radius:      3
Linux DEs Covered:  9
```

---

**This mod is production-ready and follows Zen Mods best practices.**
