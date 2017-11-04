
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def get_book_list(library, collection)
    library.book_list(collection)
  end

end
