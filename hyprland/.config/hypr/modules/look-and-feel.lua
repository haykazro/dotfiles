--         _____   _______ _______ __  __      _______ _______ _____       _______ _______ _______ _____
--        |     |_|       |       |  |/  |    |   _   |    |  |     \     |    ___|    ___|    ___|     |_
--        |       |   -   |   -   |     <     |       |       |  --  |    |    ___|    ___|    ___|       |
--        |_______|_______|_______|__|\__|    |___|___|__|____|_____/     |___|   |_______|_______|_______|
--

------------ general and decoration ------------
hl.config({
    general = {
        gaps_in          = 2,
        gaps_out         = 10,

        border_size      = 2,

        col              = {
            active_border   = "rgba(2EBDFFee)",
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,

        allow_tearing    = false,

        layout           = "scrolling",
    },

    decoration = {
        rounding = 10,
        rounding_power = 7,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = true,
            size = 4,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

------------ my bezier ------------
hl.curve("easeInBk", { type = "bezier", points = { { .54, .23 }, { .74, .98 } } })
hl.curve("easeInSpringBk", { type = "spring", mass = 1, stiffness = 210, dampening = 20 })

------------ animations ------------
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easeInSpringBk" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.1, bezier = "easeInBk", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5.94, spring = "easeInSpringBk", style = "slidevert" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 5.21, spring = "easeInSpringBk", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 5.94, spring = "easeInSpringBk", style = "slidefade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


------------ layer rules ------------
hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true
})
hl.layer_rule({
    match = { namespace = "quickshell:blur" },
    blur = true,
})

------------ misc ------------
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    }
})
