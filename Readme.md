## Getting Started

Manage dotfiles with [dotbot](https://github.com/anishathalye/dotbot) and apps with [homebrew](https://brew.sh/).

git clone this repo:

	git clone git@github.com:jschoolcraft/dotfiles.git ~/code/dotfiles

Install [homebrew](https://brew.sh):

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
Let homebrew install things that this depends on (antigen, vim, neovim, etc):

    brew bundle --file=~/code/dotfiles/home/.Brewfile

then install (idempotent, so update too) the dotfiles

	~/code/dotfiles/install

Finally want to make sure to use zsh

	chpass -s /bin/zsh `whoami`

### neovim (and vim)

    pip3 install neovim
    nvim +PlugInstall +Qall

### Iterm Colors

Live in `~/.iterm-colors`, inside iTerm2 preferences "import colors"

### OS X Things

    .~/.osx

Might have to make it `chmod +x`
