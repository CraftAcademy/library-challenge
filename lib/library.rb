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
            book_in[:return_date] = return_date
            "You have just borrowed an awesome book! Please don't forget to return it."
        end
    end 
    
    def return_date
        Date.today.next_month(1).strftime("%d/%m")
    end

    def return(title)
        return_book = @inventory.find { |book| book[:title] == title }
        if return_book[:available] == false 
            then
            return_book[:available] = true
            return_book[:return_date] = nil
            File.open('./lib/inventory.yml', 'w') { |f| f.write inventory.to_yaml }
           puts "Thank you for returning this book! You're welcome to borrow another one."
        end
    end
end

    



   
