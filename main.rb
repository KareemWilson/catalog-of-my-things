require_relative './utilities/genre_and_album'

class Main
  include GenreAndAlbum

  def initialize
    @genres = load_genres
    @music_albums = load_albums

    @options = "
    Please choose an option entering a number:
    1. - List all books
    2. - List all music albums
    3. - List all movies
    4. - List of games
    5. - List all genres
    6. - List all labels
    7. - List all authors
    8. - List all sources
    9. - Add a book
    10. - Add a music album
    11. - Add a movie
    12. - Add a game

    0. - Exit
    "
  end

  # user choice handler
  def user_choice(number)
    case number
    when 2
      list_music_albums
    when 5
      list_genres
    when 10
      create_album
    end
  end

  # Run app until the exist option is chosen
  def run
    puts "\n============= Welcome to the Catalogue of things App! =============="
    terminate = false

    until terminate
      puts @options
      input = gets.chomp

      if input.match(/\A\d+\Z/) # If the input is a number continue else return an error
        number = input.to_i
        if number.between?(1, 12)
          user_choice(number)
        elsif number.zero?
          terminate = true
          puts "Thanks for using the app. \nExisting..."
        else
          puts 'Unkown input. Try again.'
        end
      else
        puts 'Use numbers only.'
      end


    end
  end
end

app = Main.new
app.run
