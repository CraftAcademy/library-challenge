class Library
    attr_accessor :books, :books_in_possession

    def initialize
        @books = YAML.load_file('./lib/data.yml')

    end

    def checkout(title)
        @find_book = @books.find { |book| book[:title] == title }
        availablity = @find_book[:available]

        availablity ? book_is_available : 'The book is unavailable'
    end
    
    def book_is_available

        @books_in_possession = []

        @find_book[:available] = false
        @find_book[:return_date] = Date.today.next_month(1)
        @books_in_possession << @find_book[:title]
        'The book is yours'
    end

    def return_date?(title)
        find_books_return_date = @books.find { |book| book[:title] == title }
        return_date = find_books_return_date[:return_date]
    end

    def display_books
        display_books = []

        # books_available = books.select { |book| book[:available] == true }
        books.each do |book|
            
            display_books << book[:title] 
        end
        display_books
    end


    
end