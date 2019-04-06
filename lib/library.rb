require "date"
require "yaml"

class Library
    def initialize
    end

    def access_books
        YAML.load_file("./lib/books.yml")
    end

    def search_by_title(title_str)
        books = access_books
        search = books.select { |book| book[:title].include? title_str }
        
    end
end
