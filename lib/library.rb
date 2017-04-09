require 'yaml'
require 'date'
require 'pry-byebug'

class Library
  attr_reader :collection, :return_date

  def initialize
    @collection = load_book_collection
  end

  def book_check_out(item, patron)
    book = find_book(item)
    case
    when book == 'no book'
      'Library does not have this book'
    when book[:available] == false
      'Book is not available. It will be returned ' +
        (@collection[book[:index]][:return_date]).to_s
    else
      perform_transaction(book, patron)
    end
  end

  def available_books
    avail_books = []
    @collection.each do |book|
      avail_books << book if book[:available] == true
    end
    avail_books
  end


  private

  def load_book_collection
    YAML.load_file('./lib/data.yml')
  end

  def update_book_collection
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
  end

  def perform_transaction(book, patron)
    # I assume each item has will be unique in the data.yml
    # (would have liked an book ID in data.yml)
    i = book[:index]
    set_book_as_borrowed(i)
    patron.borrowed_books << @collection[i]
    update_book_collection
    @collection[i]  # maybe not so nice?
        #Line added so method will return a value to check against test.
  end

  def set_return_date
    Date.today + 30
  end

  def set_book_as_borrowed(book_index)
    @collection[book_index][:available] = false
    @collection[book_index][:return_date] = set_return_date.to_s
  end

  def find_book(item)
    i = 0
    found = false
    length = @collection.length
    until found == true || i > length - 1
      found = true if @collection[i][:item] == item
      i += 1
    end
    i > length - 1 ? 'no book' :
      { index: i - 1, available: @collection[i-1][:available] }
  end

end
