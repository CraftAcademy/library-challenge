require 'yaml'
require 'Date'

class Library
    attr_accessor :collection, :books_available

    def initialize()
        @collection = YAML.load_file('./lib/data.yml')
    end

    def books_available
        collection.select { |book| book[:available] = true }
    end

    def search(book)
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
    end

    def check_out(book)
        @books_available == false ? book_not_available : lend_out_book(book)
    end
    
    def lend_out_book(book)
        collection.select { |book| book[:available] = false }
        #File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def book_not_available
        raise RuntimeError, "Book is not available"
    end

end