require 'yaml'
require 'date'

class Library

  attr_accessor :bookshelf
  BOOK_LOAN_PERIOD_MONTHS = 1

  def initialize
    @bookshelf = YAML.load_file('./lib/library_books.yml')
  end

  def release_book_to_patron(book_index)
    bookshelf[book_index].nil? ? no_book_error :
     check_book_out_from_bookshelf(book_index)
  end

  def receive_returned_book(book_index)
    book = bookshelf[book_index]
    book.nil? ? unreturnable_book_error :
     book[:available] = true
    reset_due_date(book_index)
    commit_changes_to_bookshelf
  end

  def set_due_date
    Date.today.next_month(BOOK_LOAN_PERIOD_MONTHS)
  end

  private

  def commit_changes_to_bookshelf
    File.open('./lib/library_books.yml', 'w') {|f| f.write bookshelf.to_yaml}
  end

  def check_book_out_from_bookshelf(book_index)
    book = bookshelf[book_index]
    book.nil? ? no_book_error :
     execute_checkout(book_index)
    commit_changes_to_bookshelf
    return bookshelf[book_index]
  end

  def execute_checkout(book_index)
    bookshelf[book_index][:available] = false
    bookshelf[book_index][:due_date] = set_due_date
  end

  def reset_due_date(book_index)
    bookshelf[book_index][:due_date] = nil
  end

  def no_book_error
    raise 'Book not found'
  end

  def unreturnable_book_error
    raise 'Book cannot be returned'
  end
end
