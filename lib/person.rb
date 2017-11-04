require './lib/library'

class Person
  attr_reader :name
  attr_accessor :library, :books

  def initialize(args = {})
    @name = set_name(args[:name])
    @books = []
    @library = nil
  end

  def enter_library
    @library = Library.new
  end

  private

  def set_name(name)
    name == nil ? no_name : @name = name
  end

  def no_name
    raise "Name is required"
  end
end
