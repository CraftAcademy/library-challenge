# require './lib/library.rb'
class Person

  attr_reader :name, :choice

  def initialize(name)
    @name = name
  end

  def list_all_books(library, list)
    library.list_books(list)
  end

  def list_available_books(library, list)
    library.books_available(list)
  end

  def list_by_title(library, list, title)
    library.search_by_title(list, title)
  end
end
