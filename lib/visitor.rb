 require 'yaml'
 require './lib/library.rb'
 
 class Visitor
  attr_accessor :book_shelf, :visitor_books_available #outchecked books


  def initialize
    #@book_shelf = []
  end

  def visitor_books_available(library) #try with x instead of library for understanding once test is green
    library.books_available
  end



 end