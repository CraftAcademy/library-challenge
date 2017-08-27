# require './lib/library.rb'
class Person

  attr_reader :name, :choice

  def initialize(name)
    @name = name
  end

  def list_all_books(library)
    library.list_books
  end

  def list_available_books(library)
    library.books_available
  end

  
end
