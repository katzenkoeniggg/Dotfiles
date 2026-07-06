-- Environment variables
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- hl.env("QT_SCALE_FACTOR", "1")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- hl.env("QT_QPA_PLATFORM", "wayland")
-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")

hl.env("TERMINAL", "kitty -1")

-- ######## Input method ########
-- See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
-- hl.env("QT_IM_MODULE", "fcitx")
-- hl.env("XMODIFIERS", "@im=fcitx")
-- hl.env("SDL_IM_MODULE", "fcitx")
-- hl.env("GLFW_IM_MODULE", "ibus")
-- hl.env("INPUT_METHOD", "fcitx")

-- ######## Wayland ########
-- Tearing
-- hl.env("WLR_DRM_NO_ATOMIC", "1")
-- ?
-- hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- ######## Editor ########
-- https://wiki.archlinux.org/title/Category:Text_editors
-- for example: vi nano nvim ...
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")
hl.env("SYSTEMD_EDITOR", "nvim")
