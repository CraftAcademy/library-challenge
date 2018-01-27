require './lib/library.rb'

class Client

  attr_accessor :bookshelf

  def initialize
    @bookshelf = []
  end

  def add_book(book)
    @bookshelf << book
    return @bookshelf
  end

end
