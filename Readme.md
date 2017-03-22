## Getting Started

Manage dotfiles with [homeshick](https://github.com/andsens/homeshick) and [myrepos](https://github.com/jschoolcraft/myrepos).

    brew install homeshick
    brew install myrepos

After they're installed

    homeshick clone jschoolcraft/myrepos
    homeshick link myrepos
    mr update

That should have pulled down the various dotfiles, at this point there's a dance that needs to be done to get everything sorted.

    homeshick link dotfiles

Probably open a new terminal to get updated configs, probably see an error about .zprezto stuff, so:

    homeshick cd dotfiles

if that didn't work:

    cd .homeshick/repos/dotfiles

then

    git submodule sync --recursive

Finally want to make sure to use zsh

    chpass -s /bin/zsh `whoami`

### Home Brewing

Install homebrew:

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Then install all the things:

    brew bundle --global

If that didn't work then:

    brew tap Homebrew/bundle

### Rest of the dotfiles

    vim +PlugInstall +Qall
    nvim +PlugInstall +Qall

### Vim / Neovim

If there's an error about Ultisnips or something else requiring `python` then do:

    pip3 install neovim
    pip2 install neovim

Only use the one that's installed  `pip3` or `pip2`)

### Iterm Colors

Live in `~/.iterm-colors`, inside iTerm2 preferences "import colors"

### OS X Things

    .~/.osx

Might have to make it `chmod +x`
