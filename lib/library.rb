require 'yaml'

class Library

attr_accessor :library_books

def initialize
        @library_books = {}
end

def read_books_from_file
    @library_books = YAML.load_file("./lib/data.yml")
    puts @library_books
end


end




