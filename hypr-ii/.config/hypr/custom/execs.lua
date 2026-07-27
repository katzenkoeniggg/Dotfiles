-- Auto-start applications
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("udiskie -s")
end)

-- Input method
-- hl.on("hyprland.start", function()
--     hl.exec_cmd("fcitx5")
-- end)
