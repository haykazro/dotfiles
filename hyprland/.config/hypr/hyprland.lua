--         _______ ___ ___ ______ ______ _____   _______ _______ _____
--        |   |   |   |   |   __ \   __ \     |_|   _   |    |  |     \
--        |       |\     /|    __/      <       |       |       |  --  |
--        |___|___| |___| |___|  |___|__|_______|___|___|__|____|_____/
--                              config by kazro

hl.config({
    debug = {
        disable_logs = false,
    },
})

------------ imports / sources ------------
require("modules/keybinds")
require("modules/look-and-feel")
require("modules/autostart")
require("modules/windows-and-workspace")

------------ MONITORS ------------


hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = "HDMI-A-5",
    mode = "1280x720@60",
    position = "auto-left",
    scale = "1",
})

------------ ENVIRONMENT VARIABLES ------------


hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots/")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


------------ INPUT ------------


hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0,

        touchpad     = {
            natural_scroll = true,
            middle_button_emulation = true,
            disable_while_typing = false,
            clickfinger_behavior = true,
        },
    },
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
