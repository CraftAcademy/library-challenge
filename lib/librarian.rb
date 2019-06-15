require 'pry'

class Librarian

    attr_accessor :books

    def initialize
        @books = 10
    end

    def search_books(title, author)
        {title: 'title', author: 'author'} 
    end

    def verify_reader_account(name, card_number)
        {name: "Ronald McDonald", card_number: 12345}
    end
    
    def checkout_books(title, author)
        {title: 'title', author: 'author', date: Date.today}
    end

    def update_books(title, author)
        {title: 'title', author: 'author', date: Date.today, updated?: true}
    end
        
    
end