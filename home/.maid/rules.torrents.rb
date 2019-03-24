Maid.rules do
  rule 'Move .torrent files to rtorrent' do
    dir(['~/Downloads/*.torrent', '~/Dropbox/torrents/*.torrent']).each do |path|
      move(path, '/Volumes/Download/rtorrent/watch')
    end
  end

  rule 'Unzip files' do
    dir(['/Volumes/Download/torrents/**/*.zip']).each do |path|
      Dir.chdir(File.dirname(path)) do
        `unzip -oj #{path}`
      end
      File.delete(path)
    end
  end

  rule 'Unrar files' do
    directories = []
    dir(['/Volumes/Download/torrents/**/*.rar']).each do |path|
      directories << File.dirname(path)
      next if File.exist?(File.join(File.dirname(path), `unrar lb path`))

      directories << File.dirname(path)
      Dir.chdir(File.dirname(path)) do
        `unrar e -y #{path}`
      end
    end
    directories.uniq.each do |path|
      Dir.glob(File.join(path, '*.r*')).each { |f| File.delete(f) }
    end
  end

  rule 'Move completed torrents from rtorrent to my "processing" location' do
    processed_file = '/Volumes/Download/torrents/PROCESSED_FILES'
    processed_files = File.readlines(processed_file).map(&:strip)
    # puts processed_files.count
    # puts processed_files.class
    # puts processed_files.first
    # puts processed_files.first.class
    # puts processed_files.first.inspect
    # puts processed_files.first.strip.inspect
    File.open(processed_file, 'a') do |f|
      dir(['/Volumes/Download/rtorrent/complete/**/*.{zip,pdf,epub,mobi,mkv,mp4,mp3,m4a,m4b}']).each do |path|
        next if processed_files.include? path

        puts "copying: #{path}"
        copy(path, '/Volumes/Download/torrents/')
        f.puts path
      end
    end
  end

  rule 'Move TV Shows' do
    dir(['/Volumes/Download/torrents/**/*.{mp4,mkv}']).each do |path|
      next unless path.match?(/[sS]\d{2}[eE]\d{2}/)

      if path.split(%r{/}).last.match?(/S\.H\.I\.E\.L\.D./i)
        filename = path.split(%r{/}).last
        new_path = File.join(File.dirname(path), filename.gsub(/S\.H\.I\.E\.L\.D./i, 'SHIELD.'))
        File.rename(path, new_path)
        next
      end

      `tvnamer -rbm -c ~/.tvnamer-hazel.json #{path}`
    end
  end

  rule 'Move movies' do
    dir(['/Volumes/Download/torrents/**/*.{mp4,mkv}']).each do |path|
      movie_size = 4 * 1024 * 1024 * 1024 # gigabytes
      move(path, '/Volumes/MultiMediaToo/videos/movies') if size_of(path) > movie_size
    end
  end

  rule 'Move audiobooks' do
    dir('/Volumes/Download/deluge/complete/*.{mp3,m4a}').each do |path|
      move(path, '/Volumes/MultiMediaToo/audiobooks')
    end
  end

  rule 'Move ebooks' do
    dir(
      [
        '/Volumes/Download/deluge/complete/**/*.{pdf,epub,mobi}',
        '/Volumes/Download/torrents/**/*.{pdf,epub,mobi}'
      ]
    ).each do |path|
      move(path, '/Volumes/Download/ebooks')
    end
  end

  rule 'Move audiobooks' do
    book_dirs = []
    dir(
      [
        '/Volumes/Download/deluge/complete/**/*.{mp3,m4a,m4b}',
        '/Volumes/Download/torrents/**/*.{mp3,m4a,m4b}'
      ]
    ).each do |path|
      containing_directory = File.dirname(path).split(%r{/}).last
      if %w[complete torrents].include? containing_directory
        move(path, '/Volumes/MultiMediaToo/audiobooks')
      else
        book_dirs << File.dirname(path)
      end
    end
    book_dirs.uniq.each do |path|
      move(path, '/Volumes/MultiMediaToo/audiobooks')
    end
  end

  rule 'Remove junk files' do
    dir(
      [
        '/Volumes/Download/torrents/**/*.{opf,txt,nfo,diz,sfv}',
        '/Volumes/Download/torrents/**/cover.jpg'
      ]
    ).each do |path|
      File.delete(path)
    end
  end

  rule 'Remove empty directories' do
    dir(['/Volumes/Download/deluge/complete/*',
         '/Volumes/Download/torrents/**/*']).each do |path|
      trash(path) if File.directory?(path) && dir("#{path}/*").empty?
    end
  end
end
