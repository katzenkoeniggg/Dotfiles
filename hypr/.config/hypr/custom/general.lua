-- General config
-- https://wiki.hypr.land/Configuring/Basics/Variables/

-- monitor=,addreserved, 0, 0, 0, 0  -- Custom reserved area
-- HDMI port: mirror display. To see device name, use `hyprctl monitors`

hl.config({
	general = {
		gaps_in = 4,
      gaps_out = 9,
		gaps_workspaces = 50,

		border_size = 2,
		col = {
			active_border = "rgba(62666cee)",
			inactive_border = "rgba(191919aa)",
		},

		resize_on_border = true,
		no_focus_fallback = true,
		allow_tearing = false, -- This just allows the `immediate` window rule to work

		snap = {
			enabled = true,
			window_gap = 4,
			monitor_gap = 5,
			respect_gaps = true,
		},
	},

	xwayland = {
		force_zero_scaling = true,
	},

	dwindle = {
		preserve_split = true,
		smart_split = false,
		smart_resizing = false,
		-- precise_mouse_move = true,
	},

	decoration = {
		-- 2 = circle, higher = squircle, 4 = very obvious squircle
		-- Clear squircles look really off; we use only extra .4 here to make the rounding feel more continuous
		rounding = 13,
		rounding_power = 4,
		active_opacity = 0.85,
		inactive_opacity = 0.85,

		blur = {
			enabled = true,
			xray = false,
			special = false,
			ignore_opacity = true,
			new_optimizations = true,
			size = 2,
			passes = 6,
			brightness = 0.87,
			noise = 0.05,
			contrast = 1,
			vibrancy = 0.1696,
			vibrancy_darkness = 0.67,
			popups = true,
			popups_ignorealpha = 0.6,
			input_methods = true,
			input_methods_ignorealpha = 0.8,
		},

		shadow = {
			enabled = true,
			range = 8,
			render_power = 3,
         sharp = false,
			offset = { 0, 0 },
			color = "rgba(1a1a1aee)",
		},

		-- Dim
		dim_inactive = true,
		dim_strength = 0.05,
		dim_special = 0.07,
	},

	input = {
		kb_layout = "us",
		kb_options = "caps:swapescape",
		numlock_by_default = true,
		repeat_delay = 250,
		repeat_rate = 35,

		follow_mouse = 1,
		sensitivity = 0.5,
		accel_profile = "flat",
		force_no_accel = true,
		off_window_axis_events = 2,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
			scroll_factor = 0.4,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 1,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		enable_swallow = false,
		swallow_regex = "(foot|kitty|allacritty|Alacritty)",
		on_focus_under_fullscreen = 2,
		allow_session_lock_restore = true,
		session_lock_xray = true,
		initial_workspace_tracking = false,
		focus_on_activate = true,
	},

	binds = {
		scroll_event_delay = 0,
		hide_special_on_workspace_change = true,
	},

	cursor = {
		zoom_factor = 1,
		zoom_rigid = false,
		hotspot_padding = 1,
	},
})

-- Animations
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Curves
hl.curve("expressiveFastSpatial", { type = "bezier", points = { { 0.42, 1.67 }, { 0.21, 0.90 } } })
hl.curve("expressiveSlowSpatial", { type = "bezier", points = { { 0.39, 1.29 }, { 0.35, 0.98 } } })
hl.curve("expressiveDefaultSpatial", { type = "bezier", points = { { 0.38, 1.21 }, { 0.22, 1.00 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("standardDecel", { type = "bezier", points = { { 0, 0 }, { 0, 1 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.52, 0.03 }, { 0.72, 0.08 } } })
hl.curve("stall", { type = "bezier", points = { { 1, -0.1 }, { 0.7, 0.85 } } })

-- Windows
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 3,
	bezier = "emphasizedDecel",
	style = "popin 80%",
})
hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 3,
	bezier = "emphasizedDecel",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 2,
	bezier = "emphasizedDecel",
	style = "popin 90%",
})
hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 2,
	bezier = "emphasizedDecel",
})
hl.animation({
	leaf = "windowsMove",
	enabled = true,
	speed = 3,
	bezier = "emphasizedDecel",
	style = "slide",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 10,
	bezier = "emphasizedDecel",
})

-- Popups
hl.animation({
	leaf = "fadePopupsIn",
	enabled = true,
	speed = 3,
	bezier = "expressiveFastSpatial",
})
hl.animation({
	leaf = "fadePopupsOut",
	enabled = true,
	speed = 3,
	bezier = "expressiveFastSpatial",
})

-- Layers
hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 2.7,
	bezier = "emphasizedDecel",
	style = "popin 93%",
})
hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 2.4,
	bezier = "menu_accel",
	style = "popin 94%",
})

-- Fade
hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 0.5,
	bezier = "menu_decel",
})
hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 2.7,
	bezier = "stall",
})

-- Workspaces
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 5,
	bezier = "menu_decel",
	style = "slide",
})

-- Special workspace
hl.animation({
	leaf = "specialWorkspaceIn",
	enabled = true,
	speed = 2.8,
	bezier = "emphasizedDecel",
	style = "slidevert",
})
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 1.2,
	bezier = "emphasizedAccel",
	style = "slidevert",
})
