require 'yaml'

class Library
    attr_accessor :book_collection

    def initialize
        @book_collection = YAML.load_file('./lib/data.yml')
    end

    def show_collection
        collection = []
        @book_collection.each do |key,value|
            collection << key[:item]
        end
        collection
    end

    def available_books 
        books = [] 
       @book_collection.each do |key,value|
            if( key[:available] == true)
               books << key[:item]
            else 
            end 
        end
        books
    end

    def check_return_date(title)
        book = @book_collection.detect { |obj| obj[:item][:title] == title }
        book[:return_date]
     end
     
end