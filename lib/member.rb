require 'date'
require 'yaml'

class Member

    attr_accessor :name, :members_book_view


    def initialize(attrs={})
        @name = attrs[:name]
        @members_book_view = nil
    end

    
    def check_available_books(library)
        @members_book_view = library.available_books
    end

    private


end