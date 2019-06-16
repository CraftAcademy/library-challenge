require 'yaml'
require './lib/visitor.rb'
require './lib/book.rb'

class Library

attr_accessor :library_books

def initialize
    read_book_file('./lib/data.yml') 
end

def read_book_file(file)
    @library_books = YAML.load_file(file)
end

def find_title(suggested_title)
    # printf "%s by these author(s) : ", suggested_title
    author_list = Array.new
    @library_books.each{|k,v|
        if k[:item][:title] == suggested_title
           author_list << k[:item][:author]
        end
    }
end
def find_author(suggested_author)
    # printf "%s has these titles: ", suggested_author
    title_list = Array.new
    @library_books.each{|k,v|
        if k[:item][:author] == suggested_author
            title_list << k[:item][:title]
        end
    }
end

end

#pry(main)> li.each{|k, v| puts "item = #{k[:item]} and title = #{k[:item][:title]}"}

#[86] pry(main)> load("lib/library.rb") ; lib = Library.new ; lib.read_books_from_file("./lib/data.yml") ; lib.find_title("Onsynligt med Alfons")



