require_relative './open_file'
require_relative '../modules/music_album'

module AlbumOperations
    FILE_PATH = '../storage/music_album.json'

    def create_album
        puts "Enter the album's publish date: YY/MM/DD"
        publish_date = gets.chomp

        puts "Is this album on Spotify? (Y/N)"
        on_spotify = gets.chomp.upcase == 'Y'

        MusicAlbum.new(publish_date, on_spotify)
        puts "Album created successfully!"
    end

    def list_music_albums
       if @music_albums.empty?
        puts "No music albums available. Please add one."
       else
        @music_albums.each_with_index {|album, index| puts"#{index}) Author Name: #{album.author}, Publication Date: #{album.publish_date}, Genre: #{album.album.name}, Label: #{album.label.title}, On Spotify: #{album.on_spotify}"}
       end
    end

    def load_albums
        data = open_file(FILE_PATH)
        return [] unless data.any?
        data.map {|album| MusicAlbum.new(album['publish_date'], album['archived'])}
    end
end