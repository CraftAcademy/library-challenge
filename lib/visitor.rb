require './lib/library.rb'
require 'yaml'
require 'date'

class Visitor
  attr_accessor :name, :library, :available

  def initialize(attrs = {})
    @name = attrs[:name]
    @library = attrs[:library]
    # @available = available
 end

 def display_library_books
   @library.list
 end

 def display_available_books
   books = @library.available_books
   books.each do |book|
     puts book[:item][:title]
   end
 end
end
