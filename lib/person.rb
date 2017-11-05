
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def get_book_list(library, list)
    library.book_list
  end

end
