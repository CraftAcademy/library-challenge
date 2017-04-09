require './lib/library.rb'

class Patron

  attr_accessor :borrowed_books

  def initialize()
    @borrowed_books = []
  end

  def borrow_book(attrs = {})
    attrs[:library].book_check_out(attrs[:item], self)
  end

end
