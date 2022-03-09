#	stolen from: https://github.com/davidtwco/dotfiles
# ==================================================

# Functions {{{
# =========
_has() {
    which $1>/dev/null 2>&1
}
# }}}

# Bindings {{{
# ========
# Use vim keybindings.
set -o vi
bindkey -v

# Environment {{{
# ===========
# Set a cache dir.
export ZSH_CACHE_DIR=$HOME/.zsh/cache

# 10ms for key sequences
export KEYTIMEOUT=1

# Ensure editor is Vim
export EDITOR=nvim

# Ensure Vim and others use 256 colours.
if [[ "$TERM" != "screen"* && "$TERM" != "tmux"* ]]; then
    export TERM=xterm-256color
fi

# Don't clear the screen when leaving man.
export MANPAGER='less -X'

# Make ruby a little easier to work with
# export RUBYLIB=lib:test:spec
# }}}

# SSH Agent {{{
# =========
# env=~/.ssh/agent.env
#
# agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
#
# agent_start () {
#     (umask 077; ssh-agent >| "$env")
#     . "$env" >| /dev/null ;
# }
#
# agent_load_env
#
# # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
# agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#
# if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#     agent_start
#     ssh-add
# elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#     ssh-add
# fi
#
# unset env
# }}}

# Path {{{
# ====
# In zsh, the $PATH variable is tied to the $path variable.
# This makes the $path variable act like a set.
typeset -U path

# Add our directories.
path=("$HOME/bin" $path)
path=("$HOME/.fzf/bin" $path)
path=("/usr/local/sbin" $path)
path=("/usr/local/bin" $path)

# Using the (N-/) glob qualifier we can remove paths that do not exist.
path=($^path(N-/))
# }}}

# Android SDK stuff for React Native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Completion {{{
# ==========
# Use modern completion system.
autoload -Uz compinit

# caching stolen from https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

setopt AUTO_LIST     # automatically list choices on ambiguous completion
setopt AUTO_MENU     # automatically use menu completion
setopt ALWAYS_TO_END # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# }}}


# Conveniences {{{
# =======

setopt AUTO_CD       # cd by typing directory name if the name isn't a command
setopt CORRECT_ALL   # autocorrect commands

# }}}

# History {{{
# =======
# Keep 10000000 lines of history within the shell and save it to ~/.zsh_history:
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
# }}}

# Aliases {{{
# =======
# Load our aliases.
if [ -f ~/.shell/.aliases ]; then
    . ~/.shell/.aliases
fi

if [ -f ~/.shell/.octopi.aliases ]; then
    . ~/.shell/.octopi.aliases
fi
# }}}

antibody bundle < "$HOME/.antibody" > "$HOME/.zsh_plugins.sh"
source "$HOME/.zsh_plugins.sh"

# }}}

# fasd {{{
# =====
# if _has fasd; then
#     fasd_cache="$ZSH_CACHE_DIR/fasd-init-cache"
#     if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#         fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
#     fi
#     source "$fasd_cache"
#     unset fasd_cache
# fi
# }}}

# fzf {{{
# ===
# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf via local installation
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
    export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='
    --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
    --color info:108,prompt:109,spinner:108,pointer:168,marker:168
    '
fi

# fzf + ripgrep configuration
if _has fzf && _has rg; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git}" 2>/dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS=''
fi
# }}}

# stop homebrew from automatically upgrading everything
HOMEBREW_NO_AUTO_UPDATE=1

# theme, maybe?
# source ~/.purepower

. $HOME/.asdf/asdf.sh
eval "$(starship init zsh)"
