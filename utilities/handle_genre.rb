require_relative './open_file'
require_relative '../modules/genre'

module GenreOperations
    FILE_PATH = '../storage_files/genre.json'

    def create_genre
        puts "Enter genre name: "
        name = gets.chomp
        Genre.new(name)
        puts "Genre created successfully!"
    end

    def list_genres
        if @genres.empty?
            puts "No genres available. Please create one."
        else
            @genres.each_with_index {|genre, index| puts "#{index}) Name: #{genre.name}"}
        end
    end
    
    def load_genres
        data = open_file(FILE_PATH)
        return [] unless data.any?
        data.map {|genre| Genre.new(genre['name'])}
    end

    def save_genres
        return unless @genres.any?

        json_sting = JSON.generate(@genres, {max_nesting: false})
        File.write(FILE_PATH, json_sting)
    end

end