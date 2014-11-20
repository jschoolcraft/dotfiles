## Getting Started

    gem install homesick

    homesick clone jschoolcraft/dotfiles

    homesick symlink dotfiles

### Vim Things

Need to clone the [powerline-fonts repository](https://github.com/Lokaltog/powerline-fonts) with:

    git clone git@github.com:Lokaltog/powerline-fonts.git

Then install them system-wide fonts with FontBook

### Home Brewing

Install homebrew:

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Then install all the things:

HOMEBREW_CASK_OPTS="--appdir=/Applications" brew bundle ~/.Brewfile

You can ignore the HOMEBREW_CASK_OPTS but I'm using it to make sure the symlinks end up in /Applications instead of ~/Applications so Alfred et al don't bug me to move them.

### Rest of the dotfiles

    vim +BundleInstall

    chpass -s /bin/zsh `whoami`

### Iterm Colors

Live in `~/.iterm-colors`, inside iTerm2 preferences "import colors"

### OS X Things

    .~/.osx

Might have to make it `chmod +x`
