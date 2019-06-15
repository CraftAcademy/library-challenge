require 'date'
require 'yaml'

class Librarian

    attr_accessor :librarians_books

    def initialize
        @librarians_books = nil
    end

    def check_books(library)
        @librarians_books = library.books
    end

    private


end