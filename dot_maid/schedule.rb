require 'whenever'

set :output, {
  standard: '~/Desktop/cron.standard.log',
  error: '~/Desktop/cron.error.log'
}

if `hostname -s`.chomp == 'mpHaven'
  every 30.minutes do
    command '/Users/jschoolcraft/.asdf/shims/maid clean --force --rules=~/.maid/rules.torrents.rb'
  end
end

every 1.hour do
  command '/Users/jschoolcraft/.asdf/shims/maid clean --force'
end

every 1.day, at: '2:30 am' do
  command '/Users/jschoolcraft/.asdf/shims/maid clean --force --rules=~/.maid/daily.rb'
end
