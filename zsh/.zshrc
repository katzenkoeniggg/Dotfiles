################################################################################
# Powerlevel10k Instant Prompt
# (Keep this at the very top to speed up prompt initialization)
################################################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -e

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
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}%F{220}Installing %F{33}ZDHARMA-CONTINUUM Zinit…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33}%F{34}Installation successful.%f%b" || \
        print -P "%F{160}The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load required Zinit annexes (without Turbo)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

################################################################################
# Plugin Loading via Zinit
################################################################################
# fzf-tab for interactive file completion
zi light Aloxaf/fzf-tab

# Powerlevel10k (ensure it's loaded before other plugins that wrap widgets)
zi ice depth=1; zi light romkatv/powerlevel10k

# Zsh completions (for additional command completions)
zi light zsh-users/zsh-completions

# Zsh autosuggestions for improved command line experience
zi light zsh-users/zsh-autosuggestions

# Fast syntax highlighting (choose one: either fast-syntax-highlighting or zsh-syntax-highlighting)
zi light zdharma-continuum/fast-syntax-highlighting

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
   --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
   --color header:italic
   --header 'Press CTRL-Y to copy command into clipboard'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ripgrep->fzf->nvim [QUERY]
fif() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
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
eval "$(zoxide init --cmd cd zsh)"

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
alias ls="eza --color=always --all --group-directories-first --sort extension --git --icons=always --no-time --no-user --no-permissions"
alias ll="ls -lah"
alias dload="aria2c -x 8 -s 8 -j 2 -c -d ~/Downloads"
alias ff="fastfetch"
alias yz="yazi"

################################################################################
# Load Powerlevel10k Configuration (Prompt Customization)
################################################################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.local/bin:$PATH"

export GH_TOKEN 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

################################################################################
# End of .zshrc
################################################################################
