require 'date'
require 'yaml'

recipe =

class Library
    attr_accessor :book, :collection, :available, :book_status

    def initialize()
        @book = true
        @collection = YAML.load_file('./lib/data.yml')
        @book_status = :available
    end


    def load_data(collection)
        collection = collection
    end

    def checking_availability(book) 
        @book = book.select{|collection|collection[:item][:available].to eq true}
    end

    def title_search(search)
        @collection = collection.select{|collection|collection[:item][:title].include? search}  
    end
    def author_search(search)
        @collection = collection.select{|collection|collection[:item][:author].include? search}  
    end
    
    
end
