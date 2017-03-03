## Getting Started

Manage our dotfiles with [homeshick](https://github.com/andsens/homeshick) and [myrepos](https://github.com/jschoolcraft/myrepos).

After they're installed

	homeshick clone jschoolcraft/myrepos
	homeshick symlink myrepos
	mr checkout
	homeshick symlink

### Vim Things

*probably very outdated*

### Home Brewing

Install homebrew:

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Then install all the things:

    brew bundle --global

If that didn't work then:

    brew tap Homebrew/bundle

You can ignore the HOMEBREW_CASK_OPTS but I'm using it to make sure the symlinks end up in /Applications instead of ~/Applications so Alfred et al don't bug me to move them.

### Rest of the dotfiles

    vim +PlugInstall +Qall
    nvim +PlugInstall +Qall

    chpass -s /bin/zsh `whoami`

### Iterm Colors

Live in `~/.iterm-colors`, inside iTerm2 preferences "import colors"

### OS X Things

    .~/.osx

Might have to make it `chmod +x`
