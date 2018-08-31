require  'yaml'
require 'date'
#require './lib/books.yml'

class Library

    attr_accessor :list_of_books

    def initialize
        @list_of_books = YAML.load_file('./lib/books.yml')
    end

    def book_available
        @list_of_books.select { |x| x[:available] == true }
    end

end
