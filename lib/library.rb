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
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def checkout_book(title, name)
        @collection.each do |hash|
            if title == hash[:title]
                hash[:status] = 'checked-out'
                hash[:checked_out_to] = name
                hash[:return_date] = Date.today + RETURN_DATE
                File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
            end
        end
    end

    def check_available_books
        @collection.each do |hash|
            if hash[:status] == 'available'
                book = {title: hash[:title], author: hash[:author]}
                available_books.push(book)
            end
        end
        available_books
    end

    def clear_database
        @collection = nil
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end
end
