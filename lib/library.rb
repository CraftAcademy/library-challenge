class Library
    attr_accessor :books, :books_checked_out

    def initialize
        @books = YAML.load_file('./lib/data.yml')
    end

    def checkout(title)
        availablity = find_book(title)[:available]
        availablity ? book_is_available(title) : 'The book is unavailable'
    end
    

    def return_date?(title)
        find_relevant_book = @books.find { |book| book[:title] == title }
        date_to_be_returned = find_relevant_book[:return_date]
    end

    def display_books
        display_books = []

        books.each do |book|
            display_books << book[:title] 
        end
        display_books
    end

    def search_books(search_string)
        books_matching_search(search_string)
    end

    private 
    
    def find_book(title) 
        @books.find { |book| book[:title] == title }
    end

    def book_is_available(title)
        @books_checked_out = []

        make_book_unavailable(title)
        set_return_date(title)

        @books_checked_out << find_book(title)[:title]
        'The book is yours'
    end

    def set_return_date(title)
        find_book(title)[:return_date] = Date.today.next_month(1)
    end

    def make_book_unavailable(title)
        find_book(title)[:available] = false
    end

    def books_matching_search(search_string)
        titles_of_books_matched = []
        books_matching_search = @books.select { |book| book[:title].include? search_string }
        books_matching_search.each do |book| 
            titles_of_books_matched << book[:title]
        end
        titles_of_books_matched
    end
    
end