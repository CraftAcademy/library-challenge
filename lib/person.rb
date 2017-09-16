require 'yaml'
require 'date'
require './lib/library.rb'

def books
  YAML.load_file('./lib/books.yml')
end

def change_books
  File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
end

class Person
  attr_accessor :name, :book

  def initialize
    @name = name
    @book = []
  end

  def set_renter
    [:renter] == @name
    then
    change_books
  end

  def search_my_books
    books.select { |obj| obj[:item][:renter]}
    return :return_date
  end
end
