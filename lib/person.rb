require 'yaml'
require 'library.rb'

class Person
    
    attr_accessor :books, :loaned, :collection, :return_date

    def initialize
        @books = list_of_books
        @loaned = person_has_books?
        @collection
        
    end

    def list_of_books
        collection = YAML.load_file('./lib/data.yml')
        collection = true
    end

    def person_has_books?
        
    
    end


end