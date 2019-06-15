require 'date'
require 'yaml'

class Dewey

    #attributes accessor to easily change instance variables
    attr_accessor :books, :available_books

    #give instance of class initial attributes
    def initialize
        @books = YAML.load_file('./lib/collection.yml')
        available_books?
    end

    def available_books?
        @available_books = @books.select{ |obj| obj[:available] == true}
    end
    
    def checkout_book(title)
        add_return_date(title)
        not_available(title)
    end

    private

    def add_return_date(title)
        #modify .yml file at selected title to add return date
    end

    def not_available(title)
        #modify .yml file at selected title remove availability
    end


end