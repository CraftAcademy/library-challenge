require 'date'
require 'yaml'

recipe =

class Library
    attr_accessor :book, :collection

    def initialize()
        @book = 'Pippi'
        @collection
    end


    def access_file
        add_collection = YAML.load_file('./lib/data.yml')
        puts add_collection.inspect
        
    end

    def checking_availability(book) 
        @book = book
    end
    
end
