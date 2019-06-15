require 'date'
require 'yaml'

class Library
    attr_accessor :inventory

    def initialize
        @inventory = YAML.load_file('./lib/inventory.yml')
    end

    def search_by_title(title)
        @inventory.select { |book| book[:title] == title}
    end

    def search_by_author(author)
        @inventory.select { |book| book[:author] == author}
    end

    
    def borrow(title)
        book_in = @inventory.find { |book| book[:title] == title }
        if book_in[:available] == true 
            then
            book_in[:available] = false
            book_in[:return_date] = returndate
            "You can borrow the book but fuck you if u ruin it"
            
    end
end 
    
    
        def returndate
            Date.today.next_month(1).strftime("%m/%y")
        end
    end

    



   
