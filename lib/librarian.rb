require 'pry'
require 'yaml'

class Librarian

    attr_accessor :books, :library

    def initialize
        @books = 10
        @library = load_library
    end

    def load_library
        library = YAML.load(File.open(File.join(File.dirname(__FILE__), 'library.yml')))
    end

    def search_books(title)
        library.detect { |obj| obj[:item][:title] == title  }
    end

    def verify_reader_account(name, card_number)
        {name: "Ronald McDonald", card_number: 12345}
    end
    
    def checkout_books(title, author)
        {title: 'title', author: 'author', date: Date.today}
    end

    def return_books()
    end

    def update_books(title, author)
        {title: 'title', author: 'author', date: Date.today, updated?: true}
    end

    def print_receipt()
        #TODO
    end
        
    
end