require 'date'

class Library
    attr_accessor :inventory

    def initialize
        @inventory = YAML.load_file('./lib/inventory.yml')
    end

    def search_by_title
        @inventory.select { |book| book[:title] == title}
    end

    def search_by_author
        @inventory.select { |book| book[:author] == author}
    end
end
   
      
    # def borrow(title)
    # #     availablity = find_book(title)[:available]
    # #     availablity ? book_is_available(title) : 'The book is unavailable'
    # end
      
    #   def find_book(title) 
    #     @inventory.find { |book| book[:title] == title }
    #   end
      
    #   def book_is_available(title)
    #     "You can borrow the book but fuck you if u ruin it"
    #   end

    # end 


   
