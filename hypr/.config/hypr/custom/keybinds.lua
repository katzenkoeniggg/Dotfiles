-- Keybinds
-- https://wiki.hypr.land/Configuring/Basics/Binds/

-- Unbinds
hl.unbind("SUPER + J", hl.dsp.global("quickshell:barToggle"), { description = "Shell: Toggle bar" })-- # [hidden]
hl.unbind("SUPER + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Session: Lock" })-- # [hidden]
hl.unbind("SUPER + K", hl.dsp.global("quickshell:oskToggle"), { description = "Shell: Toggle on-screen keyboard" })-- # [hidden]
hl.unbind("SUPER + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"))-- # [hidden]

--##! User
hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("kitty -1 nvim ~/.config/illogical-impulse/config.json"), { description = "User: Edit shell config" } )
hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("kitty -1 nvim ~/.config/hypr/custom/keybinds.lua"), { description = "User: Edit custom keybinds" } )

-- Lock rebind
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "User: Lock" })

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
end)-- # [hidden]

-- Window Focusing
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

-- Window Move
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

--## Apps
-- Add stuff here
-- Use --! to add an extra column on the cheatsheet
-- Use --## to add a section in that column
-- Add a comment after a bind to add a description, like above

-- hl.bind("Super + Return", hl.dsp.exec_cmd(...)) -- Terminal
-- hl.bind("Super + T",      hl.dsp.exec_cmd(...)) -- [hidden] (terminal) (alt)
-- hl.bind("Ctrl + Alt + T", hl.dsp.exec_cmd(...)) -- [hidden] (terminal) (for Ubuntu people)
-- hl.bind("Super + E",      hl.dsp.exec_cmd(...)) -- File manager
-- hl.bind("Super + W",      hl.dsp.exec_cmd(...)) -- Browser
-- hl.bind("Super + C",      hl.dsp.exec_cmd(...)) -- Code editor
-- hl.bind("Ctrl + Super + SHIFT + Alt + W", hl.dsp.exec_cmd(...)) -- Office software
-- hl.bind("Super + X",      hl.dsp.exec_cmd(...)) -- Text editor
-- hl.bind("Ctrl + Super + V", hl.dsp.exec_cmd(...)) -- Volume mixer
-- hl.bind("Super + I",      hl.dsp.exec_cmd(...)) -- Settings app
-- hl.bind("Ctrl + SHIFT + Escape", hl.dsp.exec_cmd(...)) -- Task manager
