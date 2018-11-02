class Library
    require 'yaml'
    require 'date'
    attr_accessor :collection
    RETURN_DATE = 30

    def initialize
        @collection = []
    end

    def add_book(arg = {})
        book = {}
        book[:title] = arg[:title]
        book[:author] = arg[:author]
        book[:status] = 'available'
        book[:return_date] = nil
        @collection.push(book)
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def checkout_book(title)
        @collection.each do |hash|
            if title == hash[:title]
                hash[:status] = 'checked-out'
                hash[:return_date] = Date.today + RETURN_DATE
                File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
            end
        end
    end

    def available_books
        @collection.each do |hash|
            if hash[:status] == ‘available’
                puts "#{hash[:title]} from #{hash[:author]} is available"
            end
        end
    end
end

lib = Library.new
lib.add_book({title: 'HP', author:'JK'})
lib.collection
lib.add_book({title:'WD', author:'CD'})
lib.collection
lib.checkout_book('HP')