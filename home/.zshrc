source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Aliases

alias ack='ag'  # prefer ag
alias hu='homeshick pull dotfiles && homeshick symlink dotfiles'

# homebrew
alias bupd='brew update && echo "outdated:" && brew outdated'
alias bupg='brew upgrade --all && brew cleanup'

# ruby
alias irb='pry' # prefer pry

# git
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gpom='git push origin master'
alias gr='git pull --rebase'
alias gs='git status -s'

# tmux
alias tml='tmux list-sessions'
alias tma='tmux -2 attach -t $1'
alias tmk='tmux kill-session -t $1'

# react-native
alias rnios='react-native run-ios'
alias rniphone='react-native run-ios --simulator "iPhone 6s"'
alias rnipad='react-native run-ios --simulator "iPad Air 2"'

autoload -Uz promptinit
promptinit
prompt peepcode

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
eval "$(direnv hook zsh)"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
