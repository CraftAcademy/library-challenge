require './lib/library.rb'
require 'yaml'

class Visitor
  attr_accessor :visitor_available_books

  def visitor_available_books
    library.available_books
  end
end
