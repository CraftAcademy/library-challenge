require "date"
require "yaml"

class Library
    attr_accessor :books

    def initialize
        @books = YAML.load_file("./lib/books.yml")
    end

    def search_by_title(title_str)
        search = books.select { |book| book[:title].include? title_str }
    end

    def search_by_author(author_str)
        search = books.select { |book| book[:author].include? author_str }
    end


end
