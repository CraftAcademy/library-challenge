require "date"
require "yaml"

class Visitor
    attr_accessor :name

def initialize(name)
    @name = name
end

def view_books
    books = YAML.load_file("./lib/books.yml")
    books.each do |book|
        book.keep_if {|k| k != :borrowed_by}
    end
end



end