require "date"
require "yaml"

class Library
    def initialize
    end

    def access_books
        YAML.load_file("./lib/books.yml")
    end

end
