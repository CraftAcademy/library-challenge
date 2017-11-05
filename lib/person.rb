#require './lib/data.yml'
require "yaml"

class Person

  attr_accessor :name
  attr_reader :books

  def initialize(name)
    @name = set_name(name)
#    @books = read_available_books
    @books = []
  end

  def set_name(obj)
    @name = obj
  end

  def add_book(book)
    books.push(book)
  end

  def return_book(book)
    books.delete(book)
  end

end
