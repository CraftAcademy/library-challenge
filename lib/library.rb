require 'yaml'
require 'date'

class Library

  attr_accessor :bookshelf
  BOOK_LOAN_PERIOD = 30

  def initialize
    @bookshelf = YAML.load_file('./lib/books.yml')
  end

  def release_book_to_patron(book_index)
    bookshelf[book_index].nil? ? no_book_error : check_book_out_from_yaml_db(book_index)

  end

  def receive_returned_book(book_index)
    bookshelf[book_index][:available] = true
    File.open('./lib/books.yml', 'w') {|f| f.write bookshelf.to_yaml}
  end

  def set_due_date
    Date.today.next_day(BOOK_LOAN_PERIOD)
  end

  private

  def check_book_out_from_yaml_db(book_index)
    bookshelf[book_index][:available] = false
    bookshelf[book_index][:due_date] = set_due_date
    File.open('./lib/books.yml', 'w') {|f| f.write bookshelf.to_yaml}
    # File.close('./lib/books.yml') We don't need to close yaml files?
  end



  def no_book_error
    raise 'Book not found'
  end
end
