require 'yaml'
require 'date'
require './lib/library.rb'

class Person
    attr_accessor :name, :date, :book_shelf, :collection, :books

    def initialize(attrs = {})
        @name = person_name(attrs[:name])
        @date = Date.today
        @collection = YAML.load_file('./lib/books.yml')
        @book_shelf = book_shelf
        @books = title 
end

def list_books(library, collection)
        library.list_books(collection)
end
    
   




    # def book_shelf()
    # end
end
    