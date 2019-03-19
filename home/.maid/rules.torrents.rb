Maid.rules do
  rule 'Move .torrent files to rtorrent' do
    dir('~/Downloads/*.torrent').each do |path|
      move(path, '/Volumes/Download/rtorrent/watch')
    end

    dir('~/Dropbox/torrents/*.torrent').each do |path|
      move(path, '/Volumes/Download/rtorrent/watch')
    end
  end

  rule 'Move audiobooks' do
    dir('/Volumes/Download/deluge/complete/*.{mp3,m4a}').each do |path|
      move(path, '/Volumes/MultiMediaToo/audiobooks')
    end
  end
end
