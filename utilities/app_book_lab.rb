require_relative '../modules/book'
require_relative '../modules/label'
require_relative '../modules/item'
require 'json'

class AppBookLab
  def initialize
    # List of Books
    @books = []

    # List of Labels
    # @labels = Label.new.items
  end

  #  Print out all Books
  def list_all_books
    read_book_data
  end

  # Add books
  def add_book
    print "What's the Book's published_date? [YY-MM-DD]: "
    published_date = gets.chomp

    print 'Who is the Publisher? '
    publisher = gets.chomp

    print 'How is the Cover_state? '
    cover_state = gets.chomp.downcase

    book = Book.new(published_date, publisher, cover_state)
    @books << book

    save_book_data

    puts 'Book Information entered successfully!!!'
  end

  #  Save books
  def save_book_data
    data = []

    @books.each do |book|
      data << { published_date: book.published_date, archived: book.archived, publisher: book.publisher,
                cover_state: book.cover_state }
    end

    File.write('./storage_files/books.json', data.to_json)
  end

  # Read books saved
  def read_book_data
    if File.exist?('./storage_files/books.json')
      books = File.read('./storage_files/books.json')

      if books == ''
        puts 'You need to Add books first !!!'
      else
        book_data = JSON.parse(books)

        book_data.each do |b|
          print "Published in #{b['published_date']}, #{b['archived'] ? 'It can be archived' : 'Can NOT be archived'}, "
          puts "Publisher: #{b['publisher']}, #{b['cover_state']}-Cover"
          puts
        end
      end
    else
      puts 'Books are not available'
    end
  end
end

AppBookLab.new.list_all_books
