# Linux Transparency Setup Guide for Zen Browser

This guide provides detailed instructions for setting up transparency in Zen Browser on various Linux desktop environments and window managers.

## Quick Reference Table

| Desktop Environment | Tool Required | Difficulty | Notes |
|---------------------|---------------|------------|-------|
| KDE Plasma | kwin-effects-forceblur | Easy | Best Linux support |
| GNOME | Blur My Shell | Easy | Experimental |
| Hyprland | Built-in | Easy | Native support |
| Sway | Built-in | Medium | No blur |
| i3 + picom | picom | Medium | Good blur support |
| dwm | picom | Medium | Manual config |
| AwesomeWM | Built-in/picom | Medium | Lua config |
| XFCE | picom | Hard | Limited support |
| Cinnamon | Built-in | Hard | Limited support |

---

## KDE Plasma (Recommended)

### Installation

```bash
# Arch Linux / Manjaro
yay -S kwin-effects-forceblur
# or
paru -S kwin-effects-forceblur

# OpenSUSE
sudo zypper install kwin-effects-forceblur

# Other distributions
# Download from: https://github.com/taj-ny/kwin-effects-forceblur
```

### Configuration

1. Open **System Settings**

2. Navigate to **Window Management** → **Desktop Effects**

3. Find **Blur** in the list and **disable** it

4. Find **Better Blur** (or **Force Blur**) and **enable** it

5. Click the **settings icon** (gear) next to Better Blur

6. Configure the following:

   **General Tab:**
   - Blur strength: 15-20
   - Noise strength: 0 (optional)
   
   **Force Blur Tab:**
   - Click **Add**
   - Enter window class: `zen`
   - If using AUR package `zen-browser-bin`, use: `zen-browser`

7. Click **Apply**

### Verification

Run this command to check if blur is active:
```bash
qdbus org.kde.KWin /KWin supportInformation | grep -i blur
```

### Troubleshooting KDE

**Blur not appearing:**
```bash
# Restart KWin
killall kwin_x11
# or for Wayland
killall kwin_wayland
```

**Force Blur not in list:**
- Ensure you're using Plasma 5.27+ or Plasma 6
- Try installing from source: https://github.com/taj-ny/kwin-effects-forceblur

---

## GNOME

### Prerequisites

- GNOME 40 or later
- GNOME Extensions enabled

### Installation

1. Install **Blur My Shell** from [extensions.gnome.org](https://extensions.gnome.org/extension/3193/blur-my-shell/)

2. Or install via command line:
```bash
# Install gnome-extensions-cli
pip install gnome-extensions-cli

# Install Blur My Shell
gnome-extensions-cli install blur-my-shell@aunetx
```

### Configuration

1. Open Blur My Shell settings:
```bash
gnome-extensions prefs blur-my-shell@aunetx
```

2. Go to the **Applications** tab

3. Enable **Application Blur**

4. **Important:** Turn OFF **Opaque focused window**

5. Set **Opacity** slider to maximum (100%)

6. Add to whitelist:
   - Click **+**
   - Enter: `zen`
   - Or select Zen from the list if running

### Alternative: Using Custom CSS

If Blur My Shell doesn't work well:

1. Install **User Themes** extension

2. Create custom CSS in `~/.themes/YourTheme/gnome-shell/gnome-shell.css`

3. Add:
```css
.window-caption {
    background-color: rgba(0, 0, 0, 0.7);
    backdrop-filter: blur(10px);
}
```

### GNOME Limitations

- Transparency support is experimental
- Some GNOME versions may have artifacts
- May conflict with other shell extensions

---

## Hyprland

### Basic Configuration

Edit `~/.config/hypr/hyprland.conf`:

```ini
# Decoration settings
decoration {
    rounding = 10
    blur {
        enabled = true
        size = 10
        passes = 2
        new_optimizations = true
        xray = false
    }
    
    # Shadow settings (optional)
    shadow {
        enabled = true
        range = 15
        render_power = 3
        color = rgba(0, 0, 0, 0.5)
    }
}

# Window rules for Zen
windowrulev2 = opacity 0.95 0.85, class:^(zen)$
windowrulev2 = opacity 0.95 0.85, class:^(zen-browser)$

# Enable blur for Zen
windowrulev2 = blur, class:^(zen)$
windowrulev2 = blur, class:^(zen-browser)$

# Optional: Rounded corners for Zen
windowrulev2 = rounding 10, class:^(zen)$
```

### Advanced Hyprland Config

For better integration:

```ini
# Layer rules (for Zen popups)
layerrule = blur, zen
layerrule = ignorezero, zen

# Workspace assignment (optional)
windowrulev2 = workspace 1, class:^(zen)$

# Float certain Zen dialogs
windowrulev2 = float, class:^(zen)$, title:^(Picture-in-Picture)$
```

### Using with Nebula Theme

For best results with Nebula:

```ini
# In hyprland.conf
decoration {
    blur {
        enabled = true
        size = 8
        passes = 3
        new_optimizations = true
        ignore_opacity = true
    }
}

# Slightly lower opacity
windowrulev2 = opacity 0.9 0.8, class:^(zen)$
```

### Hyprland Verification

```bash
# Check if rules are applied
hyprctl clients | grep -i zen

# Reload config
hyprctl reload
```

---

## Sway

### Configuration

Edit `~/.config/sway/config`:

```
# Basic transparency
for_window [app_id="zen"] opacity 0.95
for_window [app_id="zen-browser"] opacity 0.95

# Or with different focused/unfocused opacity
for_window [app_id="zen"] opacity 0.95 0.85

# Border styling
for_window [app_id="zen"] border pixel 2
for_window [app_id="zen"] border_radius 10
```

### Sway Limitations

- Sway doesn't support blur effects natively
- For blur, consider using:
  - `swayfx` (fork with blur support)
  - `waybar` with custom CSS

### SwayFX (Blur Support)

If using SwayFX:

```
# In swayfx config
blur enable
blur_radius 10
blur_passes 2

for_window [app_id="zen"] blur enable
for_window [app_id="zen"] opacity 0.95
```

---

## i3 + picom

### Picom Configuration

Edit `~/.config/picom/picom.conf`:

```ini
# Enable blur
blur-method = dual_kawase
blur-strength = 10
blur-background = true

# Zen window rules
blur-background-exclude = [
    "!class_g = 'zen'",
    "!class_g = 'zen-browser'",
    "window_type = 'dock'",
    "window_type = 'desktop'"
];

# Opacity rules
opacity-rule = [
    "95:class_g = 'zen'",
    "95:class_g = 'zen-browser'"
];

# Rounded corners (requires picom-rounded-corners fork)
corner-radius = 10;
rounded-corners-exclude = [
    "!class_g = 'zen'"
];
```

### i3 Configuration

Edit `~/.config/i3/config`:

```
# Zen assignments
assign [class="zen"] → $ws1
assign [class="zen-browser"] → $ws1

# Floating dialogs
for_window [class="zen" window_role="dialog"] floating enable
for_window [class="zen" window_type="dialog"] floating enable
```

### Picom Forks with Better Blur

```bash
# picom-rounded-corners (AUR)
yay -S picom-rounded-corners

# picom-jonaburg (AUR)
yay -S picom-jonaburg

# picom-ftlabs (best blur)
yay -S picom-ftlabs-git
```

---

## dwm

### Using Picom

Same picom configuration as i3 (above).

### dwm Configuration

Edit `config.h` in your dwm build:

```c
static const Rule rules[] = {
    /* class      instance    title       tags mask     isfloating   monitor */
    { "zen",      NULL,       NULL,       1 << 0,       0,           -1 },
    { "zen-browser", NULL,    NULL,       1 << 0,       0,           -1 },
};

// Opacity (requires patch or compositor)
static const double opacity = 0.95;
```

### Required Patches

For native opacity support:
- `alpha` patch
- `fullscreen` patch (recommended)

---

## AwesomeWM

### Configuration

Edit `~/.config/awesome/rc.lua`:

```lua
-- Transparency rules
awful.rules.rules = {
    {
        rule = { class = "zen" },
        properties = { 
            opacity = 0.95,
            tag = screen[1].tags[1]
        }
    },
    {
        rule = { class = "zen-browser" },
        properties = { 
            opacity = 0.95,
            tag = screen[1].tags[1]
        }
    }
}

-- Rounded corners (requires picom)
client.connect_signal("manage", function(c)
    if c.class == "zen" or c.class == "zen-browser" then
        c.shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 10)
        end
    end
end)
```

### With Picom

Use same picom config as i3 for blur effects.

---

## XFCE

### Using Picom

1. Install picom:
```bash
sudo apt install picom  # Debian/Ubuntu
sudo pacman -S picom    # Arch
```

2. Use the picom configuration from i3 section

3. Add to autostart:
```bash
# In Settings → Session and Startup → Application Autostart
picom --config ~/.config/picom/picom.conf
```

### XFCE Limitations

- XFWM4 has limited transparency support
- Picom is recommended for best results
- Some themes may conflict

---

## Cinnamon

### Built-in Transparency

1. Open **System Settings** → **Effects**

2. Enable **Desktop Effects**

3. Adjust **Opacity** settings

### Using Compton/Picom

1. Disable built-in compositor:
```bash
gsettings set org.cinnamon.muffin unredirect-fullscreen-windows false
```

2. Install and configure picom (see i3 section)

3. Add to startup applications

---

## Environment Variables

Add to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
# For better GTK transparency
export GTK_THEME=Adwaita:dark

# For Qt applications (if using Qt-based DE)
export QT_QPA_PLATFORMTHEME=gtk2

# Force Wayland on supported systems (optional)
export MOZ_ENABLE_WAYLAND=1

# For NVIDIA users (experimental)
export __GLX_VENDOR_LIBRARY_NAME=mesa
export MESA_LOADER_DRIVER_OVERRIDE=iris
```

---

## Testing Transparency

### Quick Test Script

```bash
#!/bin/bash
# test-transparency.sh

echo "Testing Zen Browser transparency..."

# Check if Zen is running
if pgrep -x "zen" > /dev/null; then
    echo "✓ Zen is running"
else
    echo "✗ Zen is not running"
    exit 1
fi

# Check about:config flags
echo ""
echo "Required about:config flags:"
echo "1. browser.tabs.allow_transparent_browser = true"
echo "2. zen.widget.linux.transparency = true (Linux)"
echo "3. widget.transparent-windows = true"

echo ""
echo "Desktop Environment: $XDG_CURRENT_DESKTOP"
echo "Window Manager: $XDG_SESSION_TYPE"

echo ""
echo "Compositor check:"
if pgrep -x "picom" > /dev/null; then
    echo "✓ picom is running"
fi
if pgrep -x "compton" > /dev/null; then
    echo "✓ compton is running"
fi
if pgrep -x "kwin_x11" > /dev/null; then
    echo "✓ KWin X11 is running"
fi
if pgrep -x "kwin_wayland" > /dev/null; then
    echo "✓ KWin Wayland is running"
fi
if pgrep -x "mutter" > /dev/null; then
    echo "✓ Mutter (GNOME) is running"
fi

echo ""
echo "For issues, visit: https://github.com/yourusername/zen-transparent-glass"
```

---

## Common Issues and Solutions

### Issue: Black Background Instead of Transparent

**Solution:**
1. Enable `browser.tabs.allow_transparent_browser` in about:config
2. On Linux, also enable `zen.widget.linux.transparency`
3. Check if compositor is running

### Issue: No Blur Effect

**Solution:**
- KDE: Ensure kwin-effects-forceblur is enabled
- GNOME: Check Blur My Shell settings
- i3/Sway: Verify picom is running with blur enabled
- Hyprland: Check decoration blur settings

### Issue: Flickering

**Solution:**
```bash
# For NVIDIA users
export __GL_VRR_ALLOWED=0

# For picom users
# Add to picom.conf:
# vsync = true
# unredir-if-possible = false
```

### Issue: High CPU/GPU Usage

**Solution:**
1. Reduce blur strength
2. Disable shadows
3. Use lighter opacity
4. For picom: try `blur-method = none` or reduce `blur-strength`

### Issue: Artifacts on Window

**Solution:**
- GNOME: Disable "Opaque focused window" in Blur My Shell
- Hyprland: Set `xray = false` in blur config
- General: Increase opacity slightly

---

## Performance Tips

### For Low-End Systems

```ini
# Minimal blur config
blur-method = none
# or
blur-strength = 5

# Reduce opacity
opacity = 0.98

# Disable shadows
shadow = false
```

### For High-End Systems

```ini
# Maximum quality
blur-method = dual_kawase
blur-strength = 20
blur-deviation = 5

# Enable all effects
shadow = true
shadow-radius = 20
shadow-opacity = 0.5
```

---

## Additional Resources

- [Zen Browser Documentation](https://docs.zen-browser.app/)
- [KWin Force Blur](https://github.com/taj-ny/kwin-effects-forceblur)
- [Blur My Shell](https://github.com/aunetx/blur-my-shell)
- [Picom GitHub](https://github.com/yshui/picom)
- [Hyprland Wiki](https://wiki.hyprland.org/)

---

**Last Updated:** February 2026

For more help, open an issue on GitHub or join the Zen Browser community Discord.
