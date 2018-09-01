 require 'yaml'
 require './lib/library.rb'
 
 class Visitor
  attr_accessor :collection, :visitor_books_available


  def initialize()
    @collection = YAML.load_file('./lib/data.yml')
  end

def visitor_books_available()
  @collection.select { |book| book[:available] = true }
end

 end