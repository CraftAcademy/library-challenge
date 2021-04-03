require 'yaml'
require 'pry'

class Library 
    attr_accessor :book_list, :pulled_book

    def initialize
        @book_list
        @pulled_book
    end

    def read_book_list
        @book_list = YAML.load_file('./lib/books.yml')
    end

    def pull_book(args = {})       
        args[:title] == nil ? title_missing_error : return_book(args[:title])
    end
    
    private

    def title_missing_error
        #binding.pry
        raise RuntimeError, "Specify the title of book to pull"
    end

    def return_book(title)
        @pulled_book = @book_list.detect { |book| book[:item][:title] == title }
    end

end