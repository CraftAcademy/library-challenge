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

  def check_date(title, author)    #Individual should be able to return date
    check_date =@library.search_book(title, author)
    if check_date[:available] == false
      {:return_date => check_date[:return_date]}
    end
  end

end
