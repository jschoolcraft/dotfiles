Maid.rules do
  rule 'Update dotfiles' do
    `cd ~/code/dotfiles && git pull && ./install`
  end

  # rule 'Update homebrew' do
  #   `brew update`
  # end

  # rule 'Cleanup homebrew' do
  #   `brew cleanup`
  # end
end
