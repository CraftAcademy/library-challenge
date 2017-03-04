require 'yaml'
require 'date'

class Library
  attr_accessor :bookrack
#  ALLOWED_DAYS = 30

  def initialize
    @bookrack = YAML.load_file('./lib/booksdb.yml')
  end

  def available_books
    @bookrack.select{|obj| obj[:available] == true}
  end

  def view_all_books
    @bookrack
  end

  def check_book_availability(book_index)
    bookrack[book_index].nil? ? book_not_found : checkout_book_from_bookrack(book_index)
  end

  def set_due_date
    Date.today.next_day + 30.days
  end

  def receive_book_returned_by_patron(book_index)
    bookrack[book_index][:available] = true
    bookrack[book_index][:due_date] = nil
    File.open('./lib/booksdb.yml', 'w') {|f| f.write bookrack.to_yaml}
  end

  private

  def checkout_book_from_bookrack(book_index)
    bookrack[book_index][:available] = false
    bookrack[book_index][:due_date] = set_due_date
    File.open('./lib/booksdb.yml', 'w') {|f| f.write bookrack.to_yaml}
    bookrack[book_index]
  end

  def book_not_found
    raise 'Book not available'
  end

end
