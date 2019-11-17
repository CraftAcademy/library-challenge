require_relative "library.rb"
require "yaml"
 
class Visitor

    attr_accessor :borrowed_book, :books

    def initialize 
        @borrowed_book = nil
        @books = YAML.load_file('./lib/data.yml')
    end

    def list_books
        @all_books = []

        books.each do |book| 
            book_title = book[:item][:title]
            book_author = book[:item][:author]
            available = book[:available] ? 'Availible' : 'Not availible'
            @all_books << "#{book_title} - #{book_author} - #{available}"
        end
        @all_books
    end

    def return_book(title)
        book_returned = @books.select do |book| book[ :item][:title].include? title
        end
        if  book_returned[0][:available] == false then
            book_returned[0][:available] = true
            book_returned[0][:return_date] = nil
            File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
            "Thanks for returning the book"
            else raise "Sorry, book is already in the library!"
        end
    end

    

end
 
