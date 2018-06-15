require 'yaml'
require 'library.rb'

class Person
    
    attr_accessor :books, :loaned, :collection

    def initialize
        @books = list_of_books
        @loaned = loaned_books
        @collection
    end

    def list_of_books
        collection = YAML.load_file('./lib/data.yml')
        collection = true
    end

    def loaned_books 
        collection[0][:available] = false
    end


end