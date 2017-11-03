require_relative 'library'
class Person
  attr_accessor :name, :books
  def initialize(name)
    @name = name
    @books = []
  end
end
