require 'yaml'

class Library
 
    attr_accessor :collection, :search, :checkout; :return

    def initialize
        @collection = YAML.load_file('./lib/data.yml') 
        @search = find_book
        @checkout = checkout_book
        @return = return_book

    end

 
    
    

    def find_book(book)
        
        subject.collection.select { |obj| obj[:item][:title].include? book  }
    
    end

    def checkout_book


    end

    def return_book

    end

end

