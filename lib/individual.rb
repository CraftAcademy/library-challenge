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

   

end