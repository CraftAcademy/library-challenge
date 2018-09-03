 require 'yaml'
 require './lib/library.rb'
 
 class Visitor
  attr_accessor :book_shelf, :visitor_books_available #outchecked books


  def initialize
    #@book_shelf = []
  end

  def visitor_books_available(library)
    library.books_available
  end



 end