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

    def borrow(library, member, book_num)
        book_num -= 1
        library.checkout_book(book_num, member)
    end

    #def my_books(library, member)
        #list all books have been borrowed
    #end

    private


end