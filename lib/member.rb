require 'date'
require 'yaml'

class Member

    attr_accessor :name, :members_book_view, :searched_book_view


    def initialize(attrs={})
        @name = attrs[:name]
        @members_book_view = nil
        @searched_book_view = nil
    end

    
    def check_available_books(library)
        @members_book_view = library.available_books
    end

    def search_titles(library, search_term)
        @searched_book_view = library.available_books.select{ |obj| obj[:item][:title].include? search_term}
    end

    private


end