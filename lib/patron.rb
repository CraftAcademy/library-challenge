require './lib/error_module.rb'

class Patron

  attr_accessor :nightstand, :library

  def initialize
    @nightstand = YAML.load_file('./lib/patron_books.yml')
  end

  def search_library_bookshelf(library, attrs={})
    @library = library
    case
    when !attrs[:title].nil? then
      search_books_by_title(library, attrs[:title])
    when !attrs[:author].nil? then
      search_books_by_author(library, attrs[:author])
    else
      Error_module.search_failed_error
    end
  end

  def check_out_from_library(book_index)
    book = library.
    release_book_to_patron(book_index)
    add_book_to_nightstand(book_index, book)
  end

  def show_only_available_books(library, attrs = {})
    sorting_search(library, attrs).
    select {|book| book[:item][:available] == true}
  end

  def return_book_to_library(library_index, nightstand_index)
    library.receive_returned_book(library_index)
    nightstand.delete(nightstand[nightstand_index])
    commit_changes_to_nightstand
  end

  private

  def commit_changes_to_nightstand
    File.open('./lib/patron_books.yml', 'w') {|book| book.write nightstand.to_yaml}
  end

  def sorting_search(library, attrs)
    search_books_by_author(library, attrs[:author]).nil? ? search_books_by_title[:title] : search_books_by_author(library, attrs[:author])
  end

  def search_books_by_author(library, author)
    search = library.bookshelf.select { |book| book[:item][:author].include? author}
    search == [] ? Error_module.no_books_found : search
  end

  def search_books_by_title(library, title)
    search = library.bookshelf.select { |book| book[:item][:title].include? title}
    search == [] ? Error_module.no_books_found : search
  end

  def add_book_to_nightstand(book_index, book)
    library.bookshelf[book_index][:available] ?
     write_book_to_nightstand(book) : Error_module.book_unavailable_error
  end

  def write_book_to_nightstand(book)
    @nightstand << book
    commit_changes_to_nightstand
  end

end
