################################################################################
# Powerlevel10k Instant Prompt
# (Keep this at the very top to speed up prompt initialization)
################################################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Vim Mode
bindkey -v

################################################################################
# Shell History and Basic Keybindings
################################################################################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward

################################################################################
# Zsh Completion Setup (Compinit)
################################################################################
# (Configured by compinstall; ensures proper tab-completion behavior)
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

################################################################################
# Zinit Installer and Plugin Manager Initialization
################################################################################
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
((${+_comps})) && _comps[zinit]=_zinit

# Load required Zinit annexes (without Turbo)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

################################################################################
# Plugin Loading via Zinit
################################################################################
zinit light Aloxaf/fzf-tab
zinit ice depth=1
zinit light romkatv/powerlevel10k
zinit light MichaelAquilina/zsh-you-should-use
zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

### Snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit ice lucid wait
zinit snippet OMZP::fzf

### Plugins Config
# FZF-Tab Config
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '[%d]'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --tree -L 3 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --icons --tree -L 3 --color=always $realpath'
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:*:*' fzf-preview \
    'bat --style=numbers --color=always --line-range=:300 $realpath 2>/dev/null || \
    eza -1 --icons -T -L 2 --color=always $realpath'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'git log --oneline --graph --decorate --color=always -n 20 ${(Q)word}'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

ZVM_CURSOR_STYLE_ENABLED=false

# You-should-use Conf
export YSU_MESSAGE_FORMAT="$(tput setaf 1)Hey! I found this %alias_type for %command: %alias$(tput sgr0)"

################################################################################
# fzf Configuration and Key Bindings
################################################################################
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden \
    --exclude .git --exclude node_modules --exclude .cache \
    --exclude .cargo --exclude .npm --exclude .icons \
    --exclude go --exclude iOS\ Backup"

export FZF_DEFAULT_OPTS=$'--style=full
    --layout=reverse-list
    --info=inline-right
    --margin=2
    --header-border=inline
    --footer-border=inline
    --preview-border=dashed
    --bind ctrl-d:half-page-down,ctrl-u:half-page-up'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
    --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export | unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
}

# ripgrep->fzf->nvim [QUERY]
fif() (
    RELOAD='reload:rg --hidden --column --color=always --smart-case {q} || :'
    OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
    fzf --disabled --ansi --multi \
        --bind "start:$RELOAD" --bind "change:$RELOAD" \
        --bind "enter:become:$OPENER" \
        --bind "ctrl-o:execute:$OPENER" \
        --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
        --delimiter : \
        --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
        --preview-window '~4,+{2}+4/3,<80(up)' \
        --query "$*"
)

# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
#zstyle ':fzf-tab:*' use-fzf-default-opts yes

################################################################################
# zoxide Initialization (Directory Jumping)
################################################################################
eval "$(zoxide init zsh)"

################################################################################
# Custom PATH additions
################################################################################
export PATH=$PATH:/home/katzenkoenig/.spicetify

################################################################################
# Aliases
################################################################################
alias speed="speedtest-cli"
alias pak="flatpak"
alias pakin="flatpak install"
alias pakup="flatpak update"
alias pakun="flatpak uninstall"
alias pakse="flatpak search"
alias pakrm="flatpak remove --unused"
alias gamesh="bash gameshell.sh"
alias svim="sudoedit"
alias ll="eza -1 --color=always --icons=always -a --group-directories-first -s extension --git"
alias dload="aria2c -x 8 -s 8 -j 2 -c -d ~/Downloads"
alias ff="fastfetch"
alias yz="yazi"

################################################################################
# Load Powerlevel10k Configuration (Prompt Customization)
################################################################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim
export SUDO_EDITOR=nvim
export VISUAL=nvim
export SYSTEMD_EDITOR=nvim

################################################################################
# End of .zshrc
################################################################################
