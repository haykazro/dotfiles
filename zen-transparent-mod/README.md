# Zen Transparent Glass Theme

A beautiful, customizable transparent glass theme for Zen Browser with full Linux support. This mod brings elegant transparency, blur effects, and modern styling to your browsing experience.

![Preview](preview.png)

## Features

- **Full Transparency Support** - Make your browser background transparent
- **Linux Compatible** - Works on KDE, GNOME, Hyprland, and other Linux desktop environments
- **Glass Morphism Effects** - Beautiful blur and transparency combinations
- **Customizable Accent Colors** - Choose from 8 different accent colors
- **Animation Controls** - Adjust animation speed to your preference
- **Opacity Levels** - Light, medium, or heavy transparency
- **UI Enhancements** - Styled sidebars, URL bar, menus, and more

## Table of Contents

- [Installation](#installation)
- [Linux Setup Guide](#linux-setup-guide)
  - [KDE Plasma](#kde-plasma)
  - [GNOME](#gnome)
  - [Hyprland](#hyprland)
  - [Other WMs](#other-window-managers)
- [Customization Options](#customization-options)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## Installation

### Step 1: Install from Zen Mods Store

1. Open Zen Browser
2. Go to [Zen Mods](https://zen-browser.app/mods)
3. Search for "Zen Transparent Glass"
4. Click **Install**

### Step 2: Enable Required about:config Flags

1. Type `about:config` in the address bar and press Enter
2. Accept the warning if prompted
3. Search for and enable these flags:

```
browser.tabs.allow_transparent_browser = true
zen.widget.linux.transparency = true      (Linux only)
widget.transparent-windows = true         (Windows/Linux)
```

### Step 3: Configure the Mod

1. Open Zen Browser Settings
2. Go to **Mods** → **Zen Transparent Glass**
3. Click the **Settings** (gear) icon
4. Enable the features you want

### Step 4: Restart Zen Browser

Quit and reopen Zen Browser to apply all changes.

## Linux Setup Guide

Transparency on Linux requires additional setup depending on your desktop environment or window manager.

### KDE Plasma

**Requirements:**
- KDE Plasma 5.27+ or Plasma 6
- `kwin-effects-forceblur` or similar blur effect

**Setup:**

1. Install `kwin-effects-forceblur` from AUR:
```bash
# For Arch-based distributions
yay -S kwin-effects-forceblur
# or
paru -S kwin-effects-forceblur
```

2. Open **System Settings** → **Window Management** → **Desktop Effects**

3. Disable the default **Blur** effect

4. Enable **Better Blur** (or **Force Blur**)

5. Click the settings icon for Better Blur

6. Go to the **Force Blur** tab

7. Add `zen` to the list of window classes:
   - If installed from AUR as `zen-browser-bin`, use `zen-browser`
   - Otherwise, use `zen`

8. Configure blur settings:
   - **Blur strength**: 15-20
   - **Noise strength**: 0 (optional)

9. Apply and restart Zen Browser

**Alternative: Using KWin Scripts**

If you prefer a script-based approach:
```bash
# Install kwin-script-forceblur
yay -S kwin-script-forceblur
```

Then enable it in System Settings → KWin Scripts.

### GNOME

**Requirements:**
- GNOME 40+
- Blur My Shell extension

**Setup:**

1. Install **Blur My Shell** extension:
   - Visit [extensions.gnome.org](https://extensions.gnome.org/extension/3193/blur-my-shell/)
   - Toggle to install

2. Open Blur My Shell settings:
```bash
gnome-extensions prefs blur-my-shell@aunetx
```

3. Go to the **Applications** tab

4. Enable **Application Blur**

5. Turn OFF **Opaque focused window**

6. Set the **Opacity** slider to maximum (to avoid artifacts)

7. Add `zen` to the whitelist

8. Restart Zen Browser

**Note:** GNOME transparency support is experimental and may have some limitations.

### Hyprland

**Requirements:**
- Hyprland with transparency support
- Proper window rules

**Setup:**

1. Edit your `hyprland.conf`:
```bash
nano ~/.config/hypr/hyprland.conf
```

2. Add window rules for Zen:
```ini
# Zen Browser transparency
windowrulev2 = opacity 0.95, class:^(zen)$
windowrulev2 = opacity 0.95, class:^(zen-browser)$

# Optional: Blur for Zen
windowrulev2 = blur, class:^(zen)$
windowrulev2 = blur, class:^(zen-browser)$
```

3. For global blur, add to your decoration settings:
```ini
decoration {
    blur {
        enabled = true
        size = 10
        passes = 2
        new_optimizations = true
    }
}
```

4. Reload Hyprland configuration:
```bash
hyprctl reload
```

**Alternative: Using the Transparent Zen Mod with Nebula**

Some users report better results combining with Nebula theme:
1. Install the Transparent Zen mod from Zen Mods store
2. Enable `widget.transparent-windows` in about:config
3. Set Hyprland opacity to 0.9 (exact value is flexible)

### Other Window Managers

#### Sway/i3

Add to your config:
```
# For Sway
for_window [app_id="zen"] opacity 0.95
for_window [app_id="zen-browser"] opacity 0.95

# For i3 (requires picom/compton for blur)
for_window [class="zen"] opacity 0.95
for_window [class="zen-browser"] opacity 0.95
```

#### dwm/picom

Ensure your `picom.conf` includes:
```ini
blur-background = true
blur-method = dual_kawase
blur-strength = 10

# Add Zen to blur whitelist
blur-background-exclude = [
    "!class_g = 'zen'",
    "!class_g = 'zen-browser'"
];
```

#### AwesomeWM

Add to your `rc.lua`:
```lua
-- Transparency for Zen
awful.rules.rules = {
    {
        rule = { class = "zen" },
        properties = { opacity = 0.95 }
    },
    {
        rule = { class = "zen-browser" },
        properties = { opacity = 0.95 }
    }
}
```

## Customization Options

The mod provides extensive customization through the settings panel:

### Main Settings

| Option | Description | Default |
|--------|-------------|---------|
| Enable main browser transparency | Master toggle for transparency | ✅ Enabled |
| Enable Linux-specific fixes | Linux compatibility fixes | ✅ Enabled |
| Blur amount | Pixel value for blur effect | 10px |

### Appearance

| Option | Choices | Default |
|--------|---------|---------|
| Accent color | Purple, Blue, Green, Red, Orange, Pink, Cyan, White | Purple |
| Transparency opacity | Light, Medium, Heavy | Medium |
| Border radius | Small, Medium, Large | Medium |
| Animation speed | None, Fast, Normal, Slow | Normal |

### UI Elements

| Option | Description | Default |
|--------|-------------|---------|
| Sidebar transparency | Make sidebar transparent | ✅ Enabled |
| URL bar transparency | Glass effect on address bar | ✅ Enabled |
| Toolbar transparency | Make toolbar transparent | ✅ Enabled |
| Glass menus | Styled context menus | ✅ Enabled |
| Workspace styling | Styled workspace buttons | ✅ Enabled |
| Pinned tab styling | Styled pinned tabs | ✅ Enabled |
| Custom scrollbar | Themed scrollbar | ✅ Enabled |

### Effects

| Option | Description | Default |
|--------|-------------|---------|
| Shadow effects | Add shadows to active elements | ✅ Enabled |
| Hover effects | Enhanced hover animations | ✅ Enabled |
| Custom loading indicator | Styled tab loading indicator | ✅ Enabled |

### Visibility

| Option | Description | Default |
|--------|-------------|---------|
| Hide workspace indicator | Remove workspace indicator | ❌ Disabled |
| Hide new tab button | Remove + button | ❌ Disabled |
| Hide close buttons | Show on hover only | ❌ Disabled |

## Troubleshooting

### Transparency Not Working

1. **Check about:config flags**
   - Ensure `browser.tabs.allow_transparent_browser` is `true`
   - On Linux, ensure `zen.widget.linux.transparency` is `true`

2. **Verify desktop environment support**
   - Not all Linux DEs support transparency equally
   - Check if your WM has blur/compositing enabled

3. **Check for conflicting mods**
   - Disable other transparency-related mods
   - Some mods may override transparency settings

### Blur Not Working on Linux

1. **KDE**: Ensure kwin-effects-forceblur is properly installed and configured
2. **GNOME**: Blur My Shell must be enabled and configured
3. **Hyprland**: Check that blur is enabled in decoration settings

### Performance Issues

1. Reduce blur amount (try 5px instead of 10px)
2. Disable shadow effects
3. Set animation speed to "None"
4. Use "Heavy" opacity for less transparency overhead

### Text is Hard to Read

1. Increase opacity level to "Heavy"
2. Use a darker accent color
3. Enable dark mode in Zen Browser
4. Consider using Dark Reader extension for websites without dark mode

### Windows/Mac Issues

**Windows 11:**
- Enable `widget.windows.mica` in about:config
- Consider using MicaForEveryone for better blur

**Windows 10:**
- Transparency may not work natively
- Use DWMBlurGlass or similar tools

**macOS:**
- Transparency should work out of the box
- Ensure macOS version supports window transparency

## Advanced Configuration

### Custom CSS

You can add custom CSS by editing your `userChrome.css`:

```css
/* Load this mod first */
@import url("path/to/mod.css");

/* Your custom overrides */
:root {
  --zen-glass-accent: #your-color !important;
}
```

### Manual Installation (Development)

1. Clone this repository:
```bash
git clone https://github.com/yourusername/zen-transparent-glass.git
```

2. Create a local mod folder:
```bash
mkdir -p ~/.zen/default/chrome/zen-themes/mod-zen-transparent-glass
```

3. Copy files:
```bash
cp chrome.css ~/.zen/default/chrome/zen-themes/mod-zen-transparent-glass/
```

4. Create `theme.json` in the folder with your local paths

## Known Limitations

- Some websites may not display correctly with forced transparency
- PDF viewer cannot be themed
- Mozilla Add-ons store is restricted
- Settings pages cannot be themed
- Some Linux distributions may require additional configuration

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Credits

- Inspired by [Transparent Zen](https://github.com/sameerasw/zen-themes) by sameerasw
- [Nebula](https://github.com/JustAdumbPrsn/Zen-Nebula) for Linux implementation ideas
- Zen Browser team for the amazing browser

## License

MIT License - feel free to use, modify, and distribute!

## Support

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section
2. Open an issue on GitHub
3. Join the Zen Browser Discord community

---

**Enjoy your transparent browsing experience!**
