#require './lib/data.yml'
require "yaml"

class Person

  attr_accessor :name
  attr_reader :books

  def initialize(name)
    @name = set_name(name)
#    @books = read_available_books
    @books = books
  end

  def set_name(obj)
    @name = obj
  end


end
