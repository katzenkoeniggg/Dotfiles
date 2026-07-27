-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Apps
fileManager =
    "~/.config/hypr/hyprland/scripts/launch_first_available.sh 'kitty -1 -T Yazi zsh -c yazi' 'nautilus' 'nemo' 'thunar' 'dolphin'"
codeEditor =
    "~/.config/hypr/hyprland/scripts/launch_first_available.sh 'command -v nvim && kitty -1 nvim' 'windsurf' 'antigravity' 'code' 'codium' 'cursor' 'zed' 'zedit' 'zeditor' 'kate' 'gnome-text-editor' 'emacs' 'command -v micro && kitty -1 micro'"
