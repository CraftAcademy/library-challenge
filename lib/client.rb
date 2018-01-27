require './lib/library.rb'

class Client

  def initialize
    @bookshelf = ''
  end

  def add_book(book)
    @bookshelf + book
    return @bookshelf
  end

end
