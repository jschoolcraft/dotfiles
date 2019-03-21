Maid.rules do
  rule 'Move .torrent files on other machines to dropbox' do
    dir(['~/Downloads/*.torrent']).each do |path|
      move(path, '~/Dropbox/torrents/*.torrent')
    end
  end

  rule 'Trash incomplete downloads' do
    trash(dir('~/Downloads/*.download').select { |p| 7.days.since modified_at p })
  end

  rule 'clean downloads folder' do
    trash(verbose_dupes_in('~/Downloads/*'))
    # Quick 'n' dirty duplicate download detection

    trash(dir('~/Downloads/* (1).*'))
    trash(dir('~/Downloads/* (2).*'))
    trash(dir('~/Downloads/*.1'))
  end

  rule 'Move Mac OSX applications to Applications' do
    dir('~/Downloads/*.app').each do |path|
      move(path, '/Applications/')
    end
  end

  rule 'Remove empty directories' do
    dir(['~/Downloads/**/*',
         '~/Dropbox/**/*']).each do |path|
      if File.directory?(path) && dir("#{path}/*").empty? && !path.match(/\.app/)
        trash(path)
      end
    end
  end

  rule 'empty the trash daily' do
    dir(['~/.Trash/**/*']).each do |path|
      remove(path) if 7.days.since?(accessed_at(path))
    end
  end

  rule 'Update crontab' do
    `whenever --update-crontab -f ~/.maid/schedule.rb`
  end
end
