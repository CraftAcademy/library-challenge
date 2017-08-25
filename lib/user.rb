require './lib/library.rb'
require 'date'

class User
  books = []

  def list_borrowed_books
    puts @books
  end
end
