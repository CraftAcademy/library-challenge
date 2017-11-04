# require './library.rb'
#
class Person
  attr_reader :books, :library
  def initialize(args = {})
    @name = set_name(args[:name])
    @books = []
    @library = nil
  end

  private

  def set_name(name)
    name == nil ? no_name : @name = name
  end

  def no_name
    raise "Name is required"
  end
end
