require 'date'
require 'yaml'

recipe =

class Library
    attr_accessor :book, :collection

    def initialize()
        @book = 'Pippi'
        @collection = YAML.load_file('./lib/data.yml')
    end


    def load_data(collection)
        collection = collection
    end

    def checking_availability(book) 
        @book = book
    end

    def title_search(search)
        @collection = collection.select{|collection|collection[:item][:title].include? search}
    end

    
end
