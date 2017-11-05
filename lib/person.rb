class Person
  attr_reader :name
  attr_accessor :books

  def initialize(name)
    @name = name
    @books = Array.new
  end

end
