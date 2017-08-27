require 'yaml'
require 'date'
require './lib/library.rb'

def books
  YAML.load_file('./lib/books.yml')
end

class Person
  attr_accessor :name, :book

  def initialize(name)
    @name = name
    @book = []
  end

  def set_renter(obj)
    [:renter] == @name
  end

  def search_my_books
    books.select { |obj| obj[:item][:renter]}
    return :return_date
  end

end

  def books
    YAML.load_file('./lib/books.yml')
  end
