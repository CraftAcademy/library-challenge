class Person

  attr_accessor :name, :books
# attr_reader :books

  def initialize(name)
    @name = set_name(name)
    @books = []
  end

  def set_name(obj)
    @name = obj
  end

  def add_book(book)
    books.push(book)
  end

  def return_book(book)
    books.delete(book)
  end

  def read_borrowed_books
    books
  end
end
