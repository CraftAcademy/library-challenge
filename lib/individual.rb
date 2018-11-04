require './lib/library.rb'

class Individual
    def books_currently_available
        available_books_titles
    end

    def when_to_return_book(title)
        return_date =Library.new.return_date?(title)
        "The book needs to be returned on #{return_date}"
    end

    def books_borrowed   
        books_in_possession
    end

    private

    def available_books_titles
        available_books_titles = []

        books_available = Library.new.books.select { |book| book[:available] == true }
        books_available.each do |book|
            available_books_titles << book[:title] 
        end
        available_books_titles
    end

    def books_in_possession
        books_at_home = []

        search_books_array = Library.new.books.select { |book| book[:return_date] != nil }
        search_books_array.each do |book| 
            books_at_home << book[:title]
        end
       
        books_at_home
    end

end