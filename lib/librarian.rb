require 'date'
require 'yaml'

class Librarian

    attr_accessor :librarians_book_view

    def initialize
        @librarians_book_view = nil
    end

    def check_books(library)
        @librarians_book_view = library.books
    end

    private


end