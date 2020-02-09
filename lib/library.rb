require 'yaml'

class Library
    attr_accessor :collection
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

    def borrowed_book 
        borrowed_book = @collection.select { |obj| obj[:available]== false}
        end

    def show_available_books
        available_books = @collection.select { |obj| obj[:available] == true }
         end
        
    def select_book(title)
        @selected_book = @collection.select { |obj| obj[:item][:title] == title }
        end

    def due_date
        Date.today + 30
        end

    # def mybooks
    #     @mybooks = @collection.select { |obj| obj[:item][:available] == false }
    #     end
    
    
end