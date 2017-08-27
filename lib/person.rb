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

  def list_by_author(library, list, author)
    library.search_by_author(list, author)
  end

  def borrow_book(library, list, title)
    library.borrow_a_book(list, title, @name)
  end

  def return_book(library, list, title)
    library.return_a_book(list, title)
  end

  def books_on_loan(library, list)
    library.my_books_on_loan(list, @name)
  end
end
