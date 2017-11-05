
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def get_book_list(library, list)
    library.book_list
  end

  def get_search_title(library, list)
    library.search_title
  end

end
