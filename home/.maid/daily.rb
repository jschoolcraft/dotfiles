Maid.rules do
  rule 'Update homebrew' do
    `brew update`
  end

  rule 'Cleanup homebrew' do
    `brew cleanup`
  end
end
