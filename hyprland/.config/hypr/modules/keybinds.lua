--         __  __ _______ ___ ___ ______ __ _______ _____  _______
--        |  |/  |    ___|   |   |   __ \__|    |  |     \|     __|
--        |     <|    ___|\     /|   __ <  |       |  --  |__     |
--        |__|\__|_______| |___| |______/__|__|____|_____/|_______|
--                           config by kazro




local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local mainMod = "SUPER"


------------ mains ------------
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.global("quickshell:togglePowerMenu"))

------------ screen shot ------------
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active"))
hl.bind(mainMod .." + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active --raw | satty --filename -"))
hl.bind(mainMod .. "+ PRINT", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))

------------ Move focus ------------
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

------------ workspace switch ------------
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

------------ scrachpad ------------
hl.bind(mainMod .. " + GRAVE", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + GRAVE", hl.dsp.window.move({ workspace = "special:magic" }))

------------ monitor switch ------------
hl.bind(mainMod .. " + TAB + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(mainMod .. " + TAB + left", hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ monitor = "+1" }), { release = true })
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.workspace.move({ monitor = "+1" }))

------------ Scroll through existing workspaces (idk what it does?)------------
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

------------ Move/resize windows ------------
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + w", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + s", hl.dsp.window.resize(), { mouse = true })
--- scrolling ---
hl.bind(mainMod .. " + ALT + right", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + ALT + left", hl.dsp.layout("swapcol l"))

------------ multimedia keys for volume and LCD brightness ------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
