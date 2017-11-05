require './lib/library'

class Person
  attr_reader :name
  attr_accessor :library, :my_books

  def initialize(args = {})
    @name = set_name(args[:name])
    @my_books = []
    @library = nil
  end

  def enter_library
    @library = Library.new
  end


  private

  def in_library?
    @library != nil
  end

  def set_name(name)
    name == nil ? no_name : @name = name
  end

  def no_name
    raise "Name is required"
  end
end
