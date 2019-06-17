require './lib/library.rb'
require 'yaml'

class Visitor
    attr_accessor  :name, :checked_out_books, :library

    def initialize(attrs = {})
        set_name(attrs[:name])
        @checked_out_books = Array.new
        @library = Library.new
    end

    def see_book_list
        @library.to_string        
    end

    def set_name(obj)
        obj == nil ? missing_name : @name = obj.to_s
    end

    def missing_name
        raise "A name is required"
    end

    def find_by_title(book_title)
        @library.find_by_title(book_title)
    end

    def find_by_author(author_name)
        @library.find_by_author(author_name)
    end
   
    def check_out(title)
        @checked_out_books << @library.check_out(title)
        #how can we make the checked out book go to a list 
        # so that visitor can see the the books they have in 
        # their possession?
    end

    def check_in(title) 
        delivered_book = @library.check_in(title)

        @checked_out_books.each{|book,v|
            if book[:item][:title] == delivered_book[:title]
                @checked_out_books - delivered_book
                return delivered_book
            end 
        }
    end

    def see_check_outs
        @checked_out_books.each{|book,v|@library.print_book(book)}
    end
end

#load("lib/visitor.rb") ; load("lib/library.rb") ; visitor = Visitor.new(name: "Camilia") ; visitor.find_by_author("Gunilla Bergström"); load("lib/visitor.rb") ; load("lib/library.rb") ; visitor = Visitor.new(name: "Camilia") ; visitor.check_out("Alfons och soldatpappan"); visitor.check_out("Skratta lagom! Sa pappa Åberg"); visitor.checked_out_books ; visitor.check_in("Skratta lagom! Sa pappa Åberg")