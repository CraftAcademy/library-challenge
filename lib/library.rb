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

    def check_out(title)
        book = @book_collection.detect { |obj| obj[:item][:title] == title }
        case
            when book_unavailable?(book)
            'The book is currently unavailable'
            when book_available?(book)
            complete_check_out(book)
            'Check out complete'
        end 
    end     

        def book_unavailable?(book)
            book[:available] == false
        end

        def book_available?(book)
            book[:available]
        end 

        def complete_check_out(book)
            book_index = @book_collection.index {|obj| obj[:item][:title] == book[:item][:title]}
            @book_collection[book_index][:available] = false
            @book_collection[book_index][:return_date] = '2018-12-31'
           ##write_to_YAML
        end    
        
        def return_book(title)
            book = @book_collection.detect { |obj| obj[:item][:title] == title }
            book_index = @book_collection.index {|obj| obj[:item][:title] == book[:item][:title]}
            @book_collection[book_index][:available] = true
            @book_collection[book_index][:return_date] = nil
          ##write_to_YAML
          'Book is Returned'
    
        end
        
end