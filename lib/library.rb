require 'yaml'

class Library

attr_accessor :library_books

def initialize
        @library_books = {}
end

def read_books_from_file(file)
    @library_books = YAML.load_file(file)
end

def find_title(suggested_title) 
    @library_books.each{|k,v| 
        puts "_____________________"
        if k[:item][:title] == suggested_title
            puts suggested_title
            puts "success!!!!"
        else
            puts "FAIL"
        end
    }
end
end

#pry(main)> li.each{|k, v| puts "item = #{k[:item]} and title = #{k[:item][:title]}"}

#[86] pry(main)> load("lib/library.rb") ; lib = Library.new ; lib.read_books_from_file("./lib/data.yml") ; lib.find_title("Onsynligt med Alfons")



