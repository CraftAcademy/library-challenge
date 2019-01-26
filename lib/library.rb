require 'yaml'
require 'date'

class Library
 
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')

    end

    def show_available_books

        available_books = []
        @collection.each do |item| 
        
        item[:available] ? available_books << item : false
        end
        available_books
    end

    def select_book(title)

        @collection.select { |obj| obj[:item][:title].include? title  }
        
        
    end
    
    def checkout_book

    end

    def write_to_file

        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        
    
    end

end

