class Library
    require 'yaml'
    require 'date'
    attr_accessor :collection, :book
    RETURN_DATE = 30

    def initialize
        @collection = {}
        @book = {}
    end

    def add_book(arg = {})
        @book[:title] = arg[:title]
        @book[:author] = arg[:author]
        @book[:availability] = 'available'
        @book[:return_date] = nil
    end
end

