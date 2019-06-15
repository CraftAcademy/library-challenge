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
        book_in = find_book(title)[:available]
        book_in ? book_is_available(title) : 'The book is unavailable'
    end
    
    def find_book(title) 
        @inventory.find { |book| book[:title] == title }
      
    end
    
    def book_is_available(title)
           "You can borrow the book but fuck you if u ruin it"
    end
end
    
    # def borrow(book)
    #     @inventory.select { |book| book[:title][:author] == book}
    #     if book[:available] == true
    #     then 
    #     book[:available] = false
    #     book[:return_date] = newdate
    #         "You can borrow the book but fuck you if u ruin it"
    #     end
    #     File.open('./lib/inventory.yml', 'w') { |f| f.write inventory.to_yaml }
    # end
    #     def newdate
    #         Date.today.next_month(1).strftime("%m/%y")
    #     end
    

    # end
      
    #   def find_book(title) 
    #     @inventory.find { |book| book[:title] == title }
    #   end
      
    #   def book_is_available(title)
    #     "You can borrow the book but fuck you if u ruin it"
    #   end

    # end 


   
