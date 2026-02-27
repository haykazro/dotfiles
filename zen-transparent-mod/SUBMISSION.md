# Zen Mods Store Submission Template

Use this template when submitting to the Zen Mods Store.

## Submission URL

Create an issue at: https://github.com/zen-browser/theme-store/issues/new/choose

Select: "Create Theme" template

---

## Form Fields

### Name
```
Zen Transparent Glass
```

### Description
```
A beautiful transparent glass theme for Zen Browser with full Linux support. Features customizable transparency, blur effects, 8 accent colors, and extensive UI customization options.
```

### Homepage
```
https://github.com/yourusername/zen-transparent-glass
```

### Image
- Upload a 600x400 PNG preview image
- Should show the transparent/glass effect clearly
- Recommended: Split view showing before/after

### Type
```
JSON Color Theme
```

### Theme Styles (chrome.css)
```css
/* Paste contents of chrome.css here */
```

### Readme
```markdown
<!-- Paste contents of README.md here -->
```

### Preferences
```json
<!-- Paste contents of preferences.json here -->
```

---

## File Structure

```
zen-transparent-glass/
├── theme.json           # Mod metadata
├── chrome.css           # Main styles
├── preferences.json     # Customization options
├── README.md            # Documentation
├── LINUX_GUIDE.md       # Linux-specific guide
├── QUICK_START.md       # Quick reference
├── preview.png          # 600x400 preview image
└── SUBMISSION.md        # This file
```

---

## Requirements Checklist

- [ ] Mod name is unique and under 25 characters
- [ ] Description is under 100 characters
- [ ] Screenshot is 600x400 PNG
- [ ] Valid README included
- [ ] Preferences are valid JSON
- [ ] Compatible with Zen Browser
- [ ] Open source
- [ ] No malicious code
- [ ] No copyright violations

---

## After Submission

1. Bot will analyze your submission
2. Pull request will be created automatically
3. Wait for approval (usually 1-7 days)
4. Mod will appear in Zen Mods Store

---

## Updating Your Mod

To update after initial submission:

1. Create a new issue
2. Select "Update Theme" template
3. Provide the changes made
4. Increment version number in theme.json
