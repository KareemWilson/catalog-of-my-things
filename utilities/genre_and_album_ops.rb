require_relative './open_file'
require_relative '../modules/music_album'
require_relative '../modules/genre'

module GenreAndAlbum
  FILE_PATH = '../storage/music_album.json'.freeze
  FILE_PATH_2 = '../storage_files/genre.json'.freeze

  # ................ GENRE OPERATIONS ....................

  def create_genre
    puts 'Enter genre name: '
    name = gets.chomp
    Genre.new(name)
  end

  def list_genres
    if @genres.empty?
      puts 'No genres available. Please create one.'
    else
      @genres.each_with_index { |genre, index| puts "#{index}) Name: #{genre.name}" }
    end
  end

  def load_genres
    data = open_file(FILE_PATH_2)
    return [] unless data.any?

    data.map { |genre| Genre.new(genre['name']) }
  end

  def save_genres
    return unless @genres.any?

    json_sting = JSON.generate(@genres, { max_nesting: false })
    File.write(FILE_PATH_2, json_sting)
  end

  # ................... ALBUM OPERATIONS .....................

  def create_album
    puts "Enter the album's publish date: YY/MM/DD"
    publish_date = gets.chomp

    puts 'Is this album on Spotify? (Y/N)'
    on_spotify = gets.chomp.upcase == 'Y'

    genre = create_genre
    album = MusicAlbum.new(publish_date, on_spotify)
    genre.add_item(album)

    @genres.push(genre)
    @music_albums.push(album)
    puts 'Album created successfully! ✌🏼'
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums available. Please add one.'
    else
      @music_albums.each_with_index do |album, index|
        puts "#{index}) Publication Date: #{album.publish_date}, Genre: #{album.genre.name},
        Label: #{album.label.title}, On Spotify: #{album.on_spotify}"
      end
    end
  end

  def load_albums
    data = open_file(FILE_PATH)
    return [] unless data.any?

    data.map { |album| MusicAlbum.new(album['publish_date'], album['archived']) }
  end

  def save_albums
    return unless @music_albums.any?

    json_sting = JSON.generate(@music_albums, { max_nesting: false })
    File.write(FILE_PATH, json_sting)
  end
end
