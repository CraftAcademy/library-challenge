require "./lib/book.rb"

class Library
  attr_accessor :book

  def create_book(args = {})
    @book = Book.new({ title: args[:title], author: args[:author] })
  end
end
