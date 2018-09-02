require 'yaml'
require 'date'
require './lib/library.rb'

class Person
    attr_accessor :name, :date, :book_shelf, :collection, :books

    def initialize(attrs = {})
        @name = :name
        @date = Date.today
        @collection = YAML.load_file('./lib/books.yml')
        @book_shelf = book_shelf
    end

    def list_available_books(library, list)
    library.books_available(list)
    end
end 
    