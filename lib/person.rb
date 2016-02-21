require 'date'
require 'pry'

class Person
  attr_accessor :name,list_of_borrowed_book

  def initialize(options ={})
    @name = options[:name]
    @list_of_borrowed_book = []
  end

end
