require 'yaml'
require './lib/visitor.rb'

class Library

attr_accessor :library_books

def initialize
    read_book_file('./lib/data.yml') 
end

def read_book_file(file)
    @library_books = YAML.load_file(file)
end

def find_title(suggested_title)
    
    @library_books.each{|book,v|
        if book[:item][:title] == suggested_title
             return book
        end
    }
    
end
def find_author(suggested_author)
    #book_list # intialized?
    @library_books.each{|book,v|
        if book[:item][:author] == suggested_author
            book_list << book
        end
    }
    book_list
end

def check_out_book(book_title)
    #what if there is no such book?
    @library_books.each{|book,v|
        if book[:item][:title] == book_title
            book[:available] = false
            book[:return_date] = "2019-08-17"
            puts "checked out book"
            puts book
            return
        end
    }
end

def check_in_book(book_title)
    @library_books.each{|book,v|
        if book[:item][:title] == book_title
            book[:available] = true
            book[:return_date] = nil
            puts "checked in book"
            puts book
            return
        end
    }
end

def add_book(title, author)
    new_book = { 
        item: { title: title, author: author } ,
        available: true,
        return_date: nil }
        @library_books << new_book
        write_to_file("./lib/trash.yml")
end

def write_to_file(path)
    File.open(path, "w") { |file| file.write(@library_books.to_yaml) }
end

def book_to_string(obj)
    #print "title %s, author %s", title, author
end

def library_to_string()
    #for libary.each ... book_to_string()
end

end
#[86] pry(main)> load("lib/library.rb") ; lib = Library.new ; lib.read_books_from_file("./lib/data.yml") ; lib.find_title("Onsynligt med Alfons")



