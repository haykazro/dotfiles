--        ________ _______ _______ _____  _______ ________ _______      _______ _______ _____
--        |  |  |  |_     _|    |  |     \|       |  |  |  |     __|    |   _   |    |  |     \
--        |  |  |  |_|   |_|       |  --  |   -   |  |  |  |__     |    |       |       |  --  |
--        |________|_______|__|____|_____/|_______|________|_______|    |___|___|__|____|_____/
--
--        ________ _______ ______ __  __ _______ ______ _______ ______ _______
--        |  |  |  |       |   __ \  |/  |     __|   __ \   _   |      |    ___|
--        |  |  |  |   -   |      <     <|__     |    __/       |   ---|    ___|
--        |________|_______|___|__|__|\__|_______|___|  |___|___|______|_______|
--                                 config by kazro



local suppressMaximizeRule = hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.window_rule({
    match = { class = "obsidian" },
    opacity = "0.999999"
})
