require 'whenever'

every 30.minutes do
  command 'maid clean --force --rules=~/.maid/rules.torrents.rb'
end

every 1.hour do
  command 'maid clean --force'
end

every 24.hours do
  command 'maid clean --force --rules=~/.maid/daily.rb'
end
