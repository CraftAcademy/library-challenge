require 'yaml'

class Library

    attr_accessor :book_list

    def initialize
        @book_list = YAML.load_file('./lib/data.yml')
    end

    def all_books
        book_list
    end

    def available_books
      @book_list.select {|book| book[:available] == true }
    end

end     