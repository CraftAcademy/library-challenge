require 'yaml'

class Library 
    attr_accessor :book_list

    def initialize
        @book_list
    end

    def read_book_list
        @book_list = YAML.load_file('./lib/books.yml')
    end

end