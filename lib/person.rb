class Person
  attr_accessor :book_shelf

  def initialize
    @book_shelf = []
  end

  def get_book(library, args={})
    book = library.books.detect{|obj| obj[args.keys.first] == (args[args.keys.first]).to_s }
    @book_shelf.push book if library.check_out(book)
  end

end
