require 'yaml'
require 'date'

class Library
  attr_accessor :bookrack
  ALLOWED_DAYS = 30

  def initialize
    @bookrack = YAML.load_file('./lib/booksdb.yml')
  end

  def available_books
    @bookrack.select{|obj| obj[:available] == true} #.each {|val| puts val}
  end

  def view_all_books
    @bookrack
  end

  def check_book_availability(book_index)
    bookrack[book_index].nil? ? book_not_found : checkout_out_book_from_bookrack(book_index)
  end

  def set_due_date
    Date.today.next_day(ALLOWED_DAYS)
  end

  private

  def check_book_out_from_bookrack(book_index)
    bookrack[book_index][:available] = false
    booksrack[book_index][:due_date] = set_due_date
    File.open('./lib/booksdb.yml', 'w') {|f| f.write bookrack.to_yaml}
    bookrack[book_index]
  end

  def book_not_found
    raise 'Book not available'
  end

  def patron_return_book(book_id)
    book_id -=1
    @bookrack[book_id][:available] = true
    @bookrack[book_id][:return_date] = 'in_house'
    File.open('./lib/booksdb.yml', 'w') { |f| f.write @books.to_yaml }
    @patron[book_id][:available] = true
    @patron[book_id][:return_date] = 'in_house'
    File.open('./lib/patrondb.yml', 'w') { |f| f.write @person.to_yaml }
  end

end
