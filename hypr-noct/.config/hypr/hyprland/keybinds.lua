require("hyprland.variables")

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local secondMod = "SUPER + SHIFT"
local ipc = "noctalia msg "

-- 1. Noctalia Binds
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"), { description = "Software Launcher" })
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"), { description = "Control Center" })
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"), { description = "Settings App" })
hl.bind(
    mainMod .. " + N",
    hl.dsp.exec_cmd(ipc .. "panel-toggle control-center notifications"),
    { description = "Notification Center" }
)
hl.bind(secondMod .. " + N", hl.dsp.exec_cmd(ipc .. "notification-dnd-toggle"), { description = "DND Toggle" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"), { description = "Clipboard Panel" })
hl.bind(mainMod .. " + I ", hl.dsp.exec_cmd(ipc .. "caffeine-toggle"), { description = "Caffeine" })
hl.bind(mainMod .. " + P ", hl.dsp.exec_cmd(ipc .. "power-cycle"), { description = "Power Cycle" })
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"), { description = "Fullscreen Screenshot" })
hl.bind(secondMod .. " + Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"), { description = "Region Screenshot" })
hl.bind(secondMod .. " + B", hl.dsp.exec_cmd(ipc .. "bar-toggle"), { description = "Bar Toggle" })
hl.bind(
    mainMod .. " + CTRL + T",
    hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"),
    { description = "Wallpaper Picker" }
)
hl.bind(
    mainMod .. " + slash",
    hl.dsp.exec_cmd(ipc .. "panel-toggle blackbartblues/keymap:panel"),
    { description = "Keymaps" }
)
hl.bind(
    mainMod .. " + G",
    hl.dsp.exec_cmd(ipc .. "plugin oldirtty/color_picker:service all pick"),
    { description = "Color Picker" }
)
hl.bind(
    secondMod .. " + G",
    hl.dsp.exec_cmd(ipc .. "panel-toggle oldirtty/color_picker:panel"),
    { description = "Color Picker Panel" }
)

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(ipc .. "panel-toggle session"), { description = "Session Toggle" })
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"), { description = "Window Switcher" })

-- 2. Apps
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal), { description = "Terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "File manager" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser), { description = "Browser" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(codeEditor), { description = "Code editor" })
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(textEditor), { description = "Text editor" })
hl.bind(secondMod .. " + CTRL +  V", hl.dsp.exec_cmd(volumeMixer), { description = "Volume mixer" })
hl.bind(secondMod .. " + CTRL + ALT + W", hl.dsp.exec_cmd(officeSoftware), { description = "Office software" })
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(taskManager), { description = "Task manager" })

-- 3. Windows
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }), { description = "Focus Left" })
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }), { description = "Focus Right" })
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }), { description = "Focus Up" })
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }), { description = "Focus Down" })

hl.bind(secondMod .. " + h", hl.dsp.window.move({ direction = "left" }), { description = "Move Left" })
hl.bind(secondMod .. " + l", hl.dsp.window.move({ direction = "right" }), { description = "Move Right" })
hl.bind(secondMod .. " + k", hl.dsp.window.move({ direction = "up" }), { description = "Move Up" })
hl.bind(secondMod .. " + j", hl.dsp.window.move({ direction = "down" }), { description = "Move Down" })

hl.bind(secondMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close Window" })

-- # Resize Mode
hl.bind("SUPER + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
    -- Set repeating binds for resizing the active window.
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    -- Larger steps
    hl.bind("SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
    hl.bind("SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
    hl.bind("SHIFT + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
    hl.bind("SHIFT + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))
end) -- # [hidden]

-- 4. Workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus Workspace" })
    hl.bind(
        secondMod .. " + " .. key,
        hl.dsp.window.move({ workspace = i }),
        { description = "Move Window to Workspace" }
    )
end

hl.bind(
    secondMod .. " + Q",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(secondMod .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- 5. Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind(
--     "XF86AudioRaiseVolume",
--     hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
--     { locked = true, repeating = true }
-- )
-- hl.bind(
--     "XF86AudioLowerVolume",
--     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
--     { locked = true, repeating = true }
-- )
-- hl.bind(
--     "XF86AudioMute",
--     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
--     { locked = true, repeating = true }
-- )
-- hl.bind(
--     "XF86AudioMicMute",
--     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
--     { locked = true, repeating = true }
-- )
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
--
-- -- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
