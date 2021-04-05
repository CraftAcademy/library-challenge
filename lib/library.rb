require './lib/visitor.rb'
require 'date'
require 'yaml'
require 'pry'

class Library 

    attr_accessor :books

    def initialize 
        @books = YAML.load_file('./lib/data_test.yml')
    end

    def book_search(input)
        book = books.select {|books| books[:book][:title].include? input}
    end

    def checkout (title, visitor)

        book = @books.detect { |books| books[:book][:title] == title}
        if book[:available] == false
            unavailable 
        else
            book[:return_date] =Date.today.next_day(30).strftime('%d/%m')
            book[:available] = false
            visitor.books_loaned.push(book)
            change_availabilty
        end
        
        
    end
    
    
    
    def change_availabilty 

        File.open('./lib/data_test.yml', 'w') {|file| file.write books.to_yaml}
    
    end
end

private

def unavailable
    raise 'Book unavailable'
end



