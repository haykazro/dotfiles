--         _______ _______ _______ _______ _______ _______ _______ ______ _______
--        |   _   |   |   |_     _|       |     __|_     _|   _   |   __ \_     _|
--        |       |   |   | |   | |   -   |__     | |   | |       |      < |   |
--        |___|___|_______| |___| |_______|_______| |___| |___|___|___|__| |___|
--                                   config by kazro

hl.on("hyprland.start", function()
    hl.exec_cmd("qs")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
