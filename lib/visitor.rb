require 'yaml'
require './lib/library.rb'

class Visitor

  attr_accessor :book_depository, :visitor_available_books

  def initialize
    @book_depository = []
    @visitor_available_books = :available
  end

  def visitor_available_books(library)
    library.available_books
  end

end