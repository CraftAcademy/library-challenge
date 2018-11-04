class Library
    require 'yaml'
    require 'date'
    attr_accessor :collection, :available_books
    RETURN_DATE = 30

    def initialize
        @collection = []
        @available_books = []
    end

    def update_collection
        if YAML.load_file('./lib/data.yml') != false
            @collection = YAML.load_file('./lib/data.yml')
            check_available_books
        end
    end

    def add_book(arg = {})
        book = {}
        book[:title] = arg[:title]
        book[:author] = arg[:author]
        book[:status] = 'available'
        book[:checked_out_to] = nil
        book[:return_date] = nil
        @collection.push(book)
        check_available_books
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def checkout_book(title, name)
        if is_book_available?(title) == true
            check_out_book_from_library_database(title,name) 
        else    
            raise 'The book has been checked-out already'
        end
    end
    
    def check_available_books
        @collection.each do |hash|
            if hash[:status] == 'available'
                @available_books.push(hash)
            else
                @available_books.delete(hash)
            end
        end
        available_books.uniq!
    end

    def is_book_available?(title)
        @available_books.each do |hash|
            if hash[:title] == title
                return true
                break
            end
        end
    end

    def check_out_book_from_library_database(title,name)
        @collection.each do |hash|
            if title == hash[:title]
                hash[:status] = 'checked-out'
                hash[:checked_out_to] = name
                hash[:return_date] = Date.today + RETURN_DATE
                File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
                check_available_books
            end
        end
    end
end
