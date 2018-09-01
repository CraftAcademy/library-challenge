 require 'yaml'
 require './lib/library.rb'
 
 class Visitor
  attr_accessor :name


  def initialize
    print 'What is your name: '
    @name = gets.chomp
  end

def visitor_books_available
  collection = Library.new
  collection.books_available
end

 end