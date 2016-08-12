class Patron

  attr_accessor :nightstand, :library

  def initialize
    @nightstand = YAML.load_file('./lib/patron_books.yml')
  end

  def search_library_bookshelf(library, attrs={})
    @library = library
    case
    when attrs[:title] != nil then
      search_books_by_title(library, attrs[:title])
    when attrs[:author] != nil then
      search_books_by_author(library, attrs[:author])
    else
      search_failed_error
    end
  end

  def check_out_from_library(book_index)
    book = library.
    release_book_to_patron(book_index)
    add_book_to_nightstand(book_index, book)
  end

  def show_only_available_books(library, attrs = {})
    sorting_search = search_books_by_author(library, attrs[:author]).nil? ? search_books_by_title[:title] : search_books_by_author(library, attrs[:author])
    sorting_search.select {|book| book[:item][:available] == true}
  end

  def return_book_to_library(library_index, nightstand_index)
    library.receive_returned_book(library_index)
    @nightstand.delete(@nightstand[nightstand_index])
    File.open('./lib/patron_books.yml', 'w') {|book| book.write nightstand.to_yaml}
  end

  private

  def search_books_by_author(library, author)
    search = library.bookshelf.select { |book| book[:item][:author].include? author}
    search == [] ? no_books_found : search
  end

  def search_books_by_title(library, title)
    search = library.bookshelf.select { |book| book[:item][:title].include? title}
    search == [] ? no_books_found : search
  end

  def add_book_to_nightstand(book_index, book)
    book_available(book_index) ? write_book_to_nightstand(book) : book_unavailable_error
  end

  def book_available(book)
    library.bookshelf[book][:available]
  end

  def write_book_to_nightstand(book)
    @nightstand << book
    File.open('./lib/patron_books.yml', 'w') {|book| book.write nightstand.to_yaml}
  end

  def book_unavailable_error
    raise 'Book unavailable'
  end

  def search_failed_error
    raise 'Please enter a title or an author'
  end

  def no_books_found
    raise 'Your search returned no books'
  end

end
