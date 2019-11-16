require 'date'
require 'yaml'

class Library

    attr_accessor :collection

    def initialize
        @collection = read_file
    end

    def read_file
        YAML.load_file('./lib/data.yml')
    end

    def list_books
        @all_books = []
        collection.each do |book|
            book_title = book[:item][:title]
            book_author = book[:item][:author]
            book_available = book[:available] ? "Available" : "Unavailable"
            all_books << "#{book_title} - #{book_author} (#{book_available})"
        end
        @all_books
    end

end
