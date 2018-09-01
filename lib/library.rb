require 'yaml'
require 'date'

class Library
    attr_reader :books

    def initialize 
        get_books
    end

    def get_books
        @books = YAML.load_file('./lib/books_database.yml')
    end

    def available_books
        @books.select do |book|
            book[:available] == true
        end        
    end       

end