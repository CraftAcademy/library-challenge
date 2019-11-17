require_relative 'library.rb'

class User
    attr_accessor :books_in_posession

    def initialize
        @books_in_posession = [] 
    end

    def checkout_book(library, title)
        selected_book = library.checkout(title)
        book_title = selected_book[:item][:title]
        book_author = selected_book[:item][:author]
        return_date = selected_book[:return_date]
        @books_in_posession << "#{book_title} - #{book_author} (Return date: #{return_date})"
    end

end