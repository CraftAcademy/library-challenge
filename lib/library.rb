require 'yaml'
require './lib/visitor.rb'
require "date"

class Library

attr_accessor :library_books

def initialize
    read_book_file('./lib/data.yml') 
end

def find_by_title(suggested_title)
    @library_books.each{|book,v|
        if book[:item][:title] == suggested_title
            book_to_string(book)
             return book
        end 
    }
end

def find_by_author(suggested_author)
    book_list = Array.new
    @library_books.each{|book,v|
        if book[:item][:author] == suggested_author
            book_list << book
        end
    }
    book_list
end

def check_out(book_title)
    @library_books.each{|book,v|
        if book[:item][:title] == book_title
            book[:available] = false
            book[:return_date] = Date.today >> 1
            puts "checked out book"
            print_book(book)
            return
            
        end
    }
end

def check_in(book_title)
     @library_books.each{|book,v|
         if book[:item][:title] == book_title
             book[:available] = true
            book[:return_date] = nil
            print_book(book)
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
        #to not trash our backup db, write a copy
        write_to_file("./lib/copy.yml") 
end



def print_book(book)
    printf "Title: %s\t Author: %s\tAvailable: %s\tReturn date: %s\n",  
    book[:item][:title],
    book[:item][:author],
    book[:available] = true,
    book[:return_date] = nil
end

def to_string
    @library_books.each{|book,v| print_book(book)}
end

# IO methods
def read_book_file(file)
    @library_books = YAML.load_file(file)
end

def write_to_file(path)
    File.open(path, "w") { |file| file.write(@library_books.to_yaml) }
end

end



