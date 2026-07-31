-- ######## Window rules ########

-- Disable transparency
-- hl.window_rule({ match = { class = "^kitty" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^foot" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^zen" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^.*Foliate" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^helium" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^.*zathura" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^.*Flatseal" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^.*g4music" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^.*Stremio" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^.*DiskUtility" }, opacity = "1.0 override 1.0 override" })
-- hl.window_rule({ match = { class = "^obsidian" }, opacity = "1.0 override 1.0 override" })

-- Uncomment to apply global transparency to all windows:
-- hl.window_rule({ match = { class = ".*" }, opacity = "0.9 override 0.9 override" })

-- Disable blur for all xwayland apps
-- hl.window_rule({ match = { xwayland = true }, no_blur = true })

-- Stay Awake
hl.window_rule({ match = { class = "^(.*)$", title = "^(.*)$" }, idle_inhibit = "fullscreen" })
-- hl.window_rule({ match = { title = "^(.*Youtube.*)" }, idle_inhibit = "focus" })

-- Picture-in-Picture: force opaque and keep blur off
hl.window_rule({
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    opacity = "1.0 override 1.0 override",
})
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, no_blur = true })

-- ######## Floating ########

hl.window_rule({ match = { title = "^(Open File)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Select a File)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Open Folder)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Save As)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(.*)(wants to save)$" }, center = true, float = true })
hl.window_rule({ match = { title = "^(.*)(wants to open)$" }, center = true, float = true })
hl.window_rule({ match = { class = "^(kdesystemsettings)$" }, center = true, float = true })
hl.window_rule({ match = { class = "^(blueberry\\.py)$" }, float = true })
hl.window_rule({ match = { class = "^(guifetch)$" }, float = true }) -- FlafyDev/guifetch
hl.window_rule({ match = { class = ".*plasmawindowed.*" }, float = true })
hl.window_rule({ match = { class = "kcm_.*" }, float = true })
hl.window_rule({ match = { class = ".*bluedevilwizard" }, float = true })
hl.window_rule({ match = { title = ".*Welcome" }, float = true })
hl.window_rule({ match = { title = ".*Shell conflicts.*" }, float = true })
hl.window_rule({
    match = { title = "^(Choose wallpaper)(.*)$" },
    center = true,
    float = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})
hl.window_rule({
    match = { class = "^(org\\.kde\\.dolphin)$" },
    center = true,
    float = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})
hl.window_rule({
    match = { class = "^(org\\.gnome\\.Nautilus)$" },
    center = true,
    float = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})
hl.window_rule({
    match = {
        class = "^(kitty)$",
        title = "^(Yazi*)$",
    },
    center = true,
    float = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})
hl.window_rule({
    match = { class = "^(pavucontrol)$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({
    match = { class = "^(nm-connection-editor)$" },
    float = true,
    center = true,
    size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({
    match = { class = "org.freedesktop.impl.portal.desktop.kde" },
    float = true,
    size = { "(monitor_w*0.60)", "(monitor_h*0.65)" },
})
hl.window_rule({
    match = { class = "^(Zotero)$" },
    float = true,
    size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({
    match = { class = "^(.*Foliate)$" },
    float = true,
    size = { "(monitor_w*0.45)", "(monitor_h*0.75)" },
})

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
-- hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0.2 })

-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- ######## Move ########
-- kde-material-you-colors spawns a window when changing dark/light theme.
-- This is to make sure it doesn't interfere at all.
hl.window_rule({
    match = { class = "^(plasma-changeicons)$" },
    float = true,
    no_initial_focus = true,
    move = { 999999, 999999 },
})

-- Hyprland-run windowrule
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move = "20 monitor_h-120",
    float = true,
})

-- stupid dolphin copy
hl.window_rule({ match = { title = "^(Copying — Dolphin)$" }, move = { 40, 80 } })

-- ######## Tiling ########
hl.window_rule({ match = { class = "^dev\\.warp\\.Warp$" }, tile = true })

-- ######## Picture-in-Picture ########
hl.window_rule({
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    float = true,
    keep_aspect_ratio = true,
    move = { "(monitor_w*0.73)", "(monitor_h*0.72)" },
    size = { "(monitor_w*0.25)", "(monitor_h*0.25)" },
    pin = true,
})

-- ######## Tearing ########
hl.window_rule({ match = { title = ".*\\.exe" }, immediate = true })
hl.window_rule({ match = { title = ".*minecraft.*" }, immediate = true })
hl.window_rule({ match = { class = "^(steam_app).*" }, immediate = true })

-- Fix Jetbrains IDEs focus/rerendering problem
hl.window_rule({
    match = { class = "^jetbrains-.*$", float = true, title = "^$|^\\s$|^win\\d+$" },
    no_initial_focus = true,
})

-- No shadow for tiled windows
-- hl.window_rule({ match = { float = false }, no_shadow = true })

-- ######## Workspace rules ########
hl.workspace_rule({ workspace = "special:special", gaps_out = 30 })
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })

-- ######## Layer rules ########
hl.layer_rule({ match = { namespace = ".*" }, xray = false })
hl.layer_rule({ match = { namespace = ".*" }, no_anim = true })

hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})
