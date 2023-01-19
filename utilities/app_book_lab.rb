require_relative '../modules/book'
require_relative '../modules/label'
require_relative './open_file'
require 'json'

module AppBookLab
  BOOKS_PATH = './storage_files/books.json'.freeze
  LABELS_PATH = './storage_files/labels.json'.freeze

  # ................ LABELS OPERATIONS ....................

  def create_label
    print 'Enter label title: '
    title = gets.chomp

    print 'Enter label color: '
    color = gets.chomp

    Label.new(title, color)
  end

  def save_labels
    return unless @labels.empty?

    json_sting = JSON.generate(@labels, { max_nesting: false })

    File.write(LABELS_PATH, json_sting)
  end

  def load_labels
    data = open_file(LABELS_PATH)
    return [] unless data.any?

    data.map { |label| Label.new(label['title'], label['color']) }
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available.Please create one.'
    else
      @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title}, Color: #{label.color}" }
    end
  end


  # ................ BOOK OPERATIONS ....................

  # Create book
  def create_book
    print "What's the Book's published_date? [YY-MM-DD]: "
    published_date = gets.chomp

    print 'Who is the Publisher? '
    publisher = gets.chomp

    print 'How is the Cover_state? '
    cover_state = gets.chomp.downcase

    label = create_label
    book = Book.new(published_date, publisher, cover_state)
    label.add_item(book)

    @books << book
    @labels << label

    puts 'Book Information entered successfully! ✌🏼'
  end

  #  Save books
  def save_books
    return unless @books.any?

    json_sting = JSON.generate(@books, { max_nesting: false })
    File.write(BOOKS_PATH, json_sting)
  end

  def load_books
    data = open_file(BOOKS_PATH)
    return [] unless data.any?

    data.map { |book| Book.new(book['published_date'], book['publisher'], book['cover_state']) }
  end

  def list_books
    if @books.empty?
      puts 'You need to Add books first !!!'
    else
      @books.each_with_index do |b, i|
        print "#{i}) Published in #{b['published_date']}, #{b['archived'] ? 'Can be archived' : 'Can NOT be archived'},"
        puts " Publisher: #{b['publisher']}, #{b['cover_state']}-Cover"
        puts
      end
    end
  end
end

class Test
  include AppBookLab

  def start
    @books = load_books
    @labels = load_labels
    create_book
    save_books
  end
end

test = Test.new
test.start
