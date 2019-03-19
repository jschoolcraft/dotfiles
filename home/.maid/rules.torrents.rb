Maid.rules do
  rule 'Move .torrent files to rtorrent' do
    dir('~/Downloads/*.torrent').each do |path|
      move(path, '/Volumes/Download/rtorrent/watch')
    end

    dir('~/Dropbox/torrents/*.torrent').each do |path|
      move(path, '/Volumes/Download/rtorrent/watch')
    end
  end
end
