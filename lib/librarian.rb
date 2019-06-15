require 'pry'

class Librarian

    attr_accessor :books

    def initialize
        @books = 10
    end

    def search_books(title, author)
        {title: 'title', author: 'author'} 
    end
    
    def checkout_books(title, author)
        {title: 'title', author: 'author', date: Date.today}
    end
        
    
end