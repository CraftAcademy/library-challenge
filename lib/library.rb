class Library
    require 'yaml'
    require 'date'
    attr_accessor :collection
    RETURN_DATE = 30

    def initialize
        @collection = []
        # @book = {}
    end

    def add_book(arg = {})
        book = {}
        book[:title] = arg[:title]
        book[:author] = arg[:author]
        book[:availability] = 'available'
        book[:return_date] = nil
        @collection.push(book)
    end
end

library = Library.new
library.add_book(title: 'fjs', author: 'fnr')
library.add_book(title: 'jtd', author: 'fhrs')
library.collection