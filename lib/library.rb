require "yaml"

class Library

    attr_accessor :books

    def initialize 
        @books = YAML.load_file('./lib/data.yml')
    end

end

def search_book_title
end

def search_book_author
end

def checkout_book
end
