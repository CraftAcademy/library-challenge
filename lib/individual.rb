require './lib/library.rb'

class Individual

    def initialize
    end

    def titles_available
        available_books_titles = []

        books_available = Library.new.books.select { |book| book[:available] == true }
        books_available.each do |book|
            available_books_titles << book[:title] 
        end
        available_books_titles
    end

    def when_to_return_book(title)
        return_date =Library.new.return_date?(title)
        "The book needs to be returned on #{return_date}"
    end

    # def books_in_possession
    # end

    # def search_books(search_string)
    #     books.select { |book| book[:title].include? search_string }
    # end

end