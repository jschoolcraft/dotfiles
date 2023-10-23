Maid.rules do
  rule "Move .torrent files to rtorrent" do
    dir(["~/Downloads/*.torrent", "~/Dropbox/torrents/*.torrent"]).each do |path|
      move(path, "/Volumes/MultiMediaToo/downloads/torrents/watch")
    end
  end

  # rule "Unzip files" do
  #   dir(["/Volumes/Download/torrents/**/*.zip"]).each do |path|
  #     Dir.chdir(File.dirname(path)) do
  #       `unzip -oj #{path}`
  #     end
  #     File.delete(path)
  #   end
  # end

  # rule "Unrar files" do
  #   directories = []
  #   dir(["/Volumes/Download/torrents/**/*.rar"]).each do |path|
  #     directories << File.dirname(path)
  #     next if File.exist?(File.join(File.dirname(path), `unrar lb #{path}`))

  #     directories << File.dirname(path)
  #     Dir.chdir(File.dirname(path)) do
  #       `unrar e -y #{path}`
  #     end
  #   end
  #   directories.uniq.each do |path|
  #     Dir.glob(File.join(path, "*.r*")).each { |f| File.delete(f) }
  #   end
  # end

  # rule 'Move completed torrents from rtorrent to my "processing" location' do
  #   processed_file = "/Volumes/Download/torrents/PROCESSED_FILES"
  #   processed_files = File.readlines(processed_file).map(&:strip)

  #   File.open(processed_file, "a") do |f|
  #     dir(["/Volumes/Download/rtorrent/complete/**/*.{zip,pdf,epub,mobi,mkv,avi,mp4,mp3,m4a,m4b}"]).each do |path|
  #       next if processed_files.include? path

  #       puts "copying: #{path}"
  #       copy(path, "/Volumes/Download/torrents/")
  #       f.puts path
  #     end
  #   end
  # end

  # rule "Remove Dupes in Torrents" do
  #   dupes_in("/Volumes/Download/torrents/").each do |dupes|
  #     trash dupes.sort_by { |p| File.mtime(p) }[0..-2]
  #   end
  # end

  # rule "Move TV Shows" do
  #   where_content_type(dir(["/Volumes/Download/torrents/**/*"]), 'video').each do |path|
  #     next unless path.match?(/s\d{2}e\d{2}/i)

  #     if path.split(%r{/}).last.match?(/S\.H\.I\.E\.L\.D./i)
  #       filename = path.split(%r{/}).last
  #       new_path = File.join(File.dirname(path), filename.gsub(/S\.H\.I\.E\.L\.D./i, "SHIELD."))
  #       File.rename(path, new_path)
  #       next
  #     end

  #     `tvnamer -rbm -c ~/.tvnamer-hazel.json #{path}`
  #   end
  # end

  # rule "Move movies" do
  #   where_content_type(dir(["/Volumes/Download/torrents/**/*"]), 'video').each do |path|
  #     movie_size = 4 * 1024 * 1024 * 1024 # gigabytes
  #     move(path, "/Volumes/MultiMediaToo/videos/movies") if size_of(path) > movie_size
  #   end
  # end

  # rule "Move ebooks" do
  #   dir(
  #     [
  #       "/Volumes/Download/deluge/complete/**/*.{pdf,epub,mobi,azw3}",
  #       "/Volumes/Download/torrents/**/*.{pdf,epub,mobi,azw3}",
  #       "/Volumes/Download/nzbget/completed/**/*.{pdf,epub,mobi,azw3}",
  #     ]
  #   ).each do |path|
  #     move(path, "/Volumes/Download/ebooks")
  #   end
  # end

  # rule "Move audiobooks" do
  #   book_dirs = []
  #   dir(
  #     [
  #       "/Volumes/Download/deluge/complete/**/*.{mp3,m4a,m4b}",
  #       "/Volumes/Download/torrents/**/*.{mp3,m4a,m4b}",
  #       "/Volumes/Download/nzbget/completed/**/*.{mp3,m4a,m4b}",
  #     ]
  #   ).each do |path|
  #     containing_directory = File.dirname(path).split(%r{/}).last
  #     if %w[complete torrents].include? containing_directory
  #       move(path, "/Volumes/MultiMediaToo/audiobooks")
  #     else
  #       book_dirs << File.dirname(path)
  #     end
  #   end
  #   book_dirs.uniq.each do |path|
  #     move(path, "/Volumes/MultiMediaToo/audiobooks")
  #   rescue => e
  #     if e.message =~ /File exists/
  #       puts "File exists, deleting source: #{path}"
  #       trash(path)
  #     end
  #     puts e
  #   end
  # end

  # rule "Remove junk files" do
  #   dir(
  #     [
  #       "/Volumes/Download/torrents/**/*.{opf,txt,nfo,diz,sfv}",
  #       "/Volumes/Download/torrents/**/{Cc}over.jpg",
  #       "/Volumes/Download/torrents/**/*{Ss}ample.*",
  #       "/Volumes/Download/deluge/complete/**/*.{opf,txt,nfo,diz,sfv}",
  #       "/Volumes/Download/deluge/complete/**/{Cc}over.jpg",
  #       "/Volumes/Download/deluge/complete/**/*{Ss}ample*",
  #       "/Volumes/Download/nzbget/completed/**/*.{opf,txt,nfo,diz,sfv}",
  #     ]
  #   ).each do |path|
  #     File.delete(path)
  #   end
  # end

  # rule "Remove empty directories" do
  #   dir(
  #     [
  #       "/Volumes/Download/deluge/complete/**/*",
  #       "/Volumes/Download/torrents/**/*",
  #       "/Volumes/Download/nzbget/completed/**/*",
  #     ]
  #   ).each do |path|
  #     remove(path) if File.directory?(path) && dir("#{path}/*").empty?
  #     remove(path) if File.directory?(path) && disk_usage(path) < 512
  #   end
  # end
end
