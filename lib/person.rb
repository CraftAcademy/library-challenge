require 'date'
require 'pry-byebug'
require './lib/library.rb'

class Person

  attr_accessor :library

  def initialize
    @library = Library.new
  end


  def check_books
    @library.books_instock
  end

  def checkout(title, author)
    @library.book_checkout(title, author)
  end



end
