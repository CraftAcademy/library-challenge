require 'pry'
require './lib/library.rb'

class Visitor < Library    
    attr_accessor :receipt, :books_in_possesion
    
    def initialize
        @books_in_possesion = Array.new
    end
    
    
    def see_available                     
        all_books = self.read_book_list
        availible_books = all_books.select { |book| book[:available] == true }             
    end

    def rent_the_book(args={})
        self.pull_book(args)
        @pulled_book[:available] == true ? give_receipt : book_unavailable
    end
    
    private
    
    def book_unavailable
        raise 'Book is unavailable'
    end
    
    def give_receipt
        self.change_status
        self.save_book_list        
        @books_in_possesion << {title: @pulled_book[:item][:title], return_date: @pulled_book[:return_date]}        
        @receipt = {title: @pulled_book[:item][:title], return_date: @pulled_book[:return_date], date: Date.today.strftime('%d-%m-%y') }
    end
end