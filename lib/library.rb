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
        book = book_pull(title)
        book[:return_date]
    end

    def check_out(title,visitor)
        book = book_pull(title)
        case
            when book_unavailable?(book)
            "We're sorry #{visitor.name} That book is currently unavailable"
            when book_available?(book)
            complete_check_out(book)
            "Thank you #{visitor.name}! Check out complete! Return date: #{Date.today}"
        end 
    end     

    def book_unavailable?(book)
        book[:available] == false
    end

    def book_available?(book)
        book[:available]
    end 

    def return_book(title,visitor)
        book = book_pull(title)
        book_index = index_pull(book)
        @book_collection[book_index][:available] = true
        @book_collection[book_index][:return_date] = nil
       # write_to_YAML
       "Thank you #{visitor.name}! The book is Returned"
    end

    private  

    def complete_check_out(book)
        book_index = index_pull(book)
        @book_collection[book_index][:available] = false
        @book_collection[book_index][:return_date] = Date.today
       # write_to_YAML
    end    

    def book_pull(title)
        book = @book_collection.detect { |obj| obj[:item][:title] == title }
    end
    
    def index_pull(book)
        book_index = @book_collection.index {|obj| obj[:item][:title] == book[:item][:title]}
    end 

    def write_to_YAML
        File.open('./lib/data.yml', 'w') { |f| f.write @book_collection.to_yaml }
    end
        
end