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
        @pulled_book[:available] == true ? update_data : book_unavailable
        @books_in_possesion << {title: @pulled_book[:item][:title], return_date: @pulled_book[:return_date]}        
        @receipt = {title: @pulled_book[:item][:title], return_date: @pulled_book[:return_date], date: Date.today.strftime('%d-%m-%y') }
    end

    def return_the_book(args={})
        self.pull_book(args)
        @pulled_book[:available] == false ? update_data : return_error
        @books_in_possesion.delete_if { |book| book[:title] == args[:title]}
    end
    
    private
    
    def book_unavailable
        raise 'Book is unavailable'
    end

    def return_error(args)
        raise `Return book error: #{args[:item][:title]} is already returned please contact staff` 
    end
    
    def update_data
        self.change_status
        self.save_book_list        
    end
end