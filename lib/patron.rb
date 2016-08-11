require './lib/library.rb'

class Patron

  attr_accessor :nightstand

  def initialize
    @nightstand = YAML.load_file('./lib/patron_books.yml')
  end

  def search_library_bookshelf(library, attrs={})
    case
    when attrs[:title] != nil then
      search_books_by_title(library, attrs[:title])
    when attrs[:author] != nil then
      search_books_by_author(library, attrs[:author])
    else
      search_failed_error
    end

  end

  def search_books_by_author(library, attrs = {})
    search = library.bookshelf.select { |book| book[:item][:author].include? attrs[:author]}
    search == [] ? no_books_found : search
  end

  def search_books_by_title(library, attrs = {})
    search = library.bookshelf.select { |book| book[:item][:title].include? attrs[:title]}
    search == [] ? no_books_found : search
  end

  private
  def search_failed_error
    raise 'Please enter a title or an author'
  end

  def no_books_found
    raise 'Your search returned no books'
  end

end
