# Zen Transparent Glass - Quick Start Guide

## 5-Minute Setup

### 1. Install the Mod (1 min)
- Go to Zen Browser Settings → Mods
- Search "Zen Transparent Glass"
- Click Install

### 2. Enable Required Flags (2 min)
1. Type `about:config` in address bar
2. Search and enable:
   - `browser.tabs.allow_transparent_browser` → `true`
   - `zen.widget.linux.transparency` → `true` (Linux only)

### 3. Configure Settings (1 min)
- Go to Settings → Mods → Zen Transparent Glass → Settings
- Enable desired features

### 4. Restart Zen (1 min)
- Quit and reopen Zen Browser

---

## Linux Users - Additional Step

Choose your desktop environment:

| DE/WM | Command/Action |
|-------|----------------|
| **KDE** | Install `kwin-effects-forceblur`, add `zen` to Force Blur list |
| **GNOME** | Install "Blur My Shell" extension, add `zen` to whitelist |
| **Hyprland** | Add `windowrulev2 = opacity 0.95, class:^(zen)$` |
| **i3** | Install `picom`, add opacity rules |

---

## Customization at a Glance

### Accent Colors
- Purple (default), Blue, Green, Red, Orange, Pink, Cyan, White

### Opacity Levels
- Light (70% transparent)
- Medium (85% transparent) ← Default
- Heavy (95% transparent)

### Animation Speed
- None, Fast, Normal, Slow

---

## Troubleshooting Checklist

- [ ] `browser.tabs.allow_transparent_browser` is `true`
- [ ] Mod is enabled in Settings → Mods
- [ ] Linux: `zen.widget.linux.transparency` is `true`
- [ ] Linux: Compositor/blur tool is running
- [ ] No conflicting transparency mods enabled
- [ ] Browser has been restarted

---

## Need Help?

- Full guide: See [README.md](README.md)
- Linux details: See [LINUX_GUIDE.md](LINUX_GUIDE.md)
- Issues: Open a GitHub issue
