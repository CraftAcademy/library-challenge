require 'date'
require 'yaml'

class Dewey

    #attributes accessor to easily change instance variables
    attr_accessor :books

    #give instance of class initial attributes
    def initialize()
        @books = YAML.load_file('./lib/collection.yml')
    end

    #public methods 
    def show_librarian
        #return entire book list
    end

    def show_member
        #return book list with available books
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