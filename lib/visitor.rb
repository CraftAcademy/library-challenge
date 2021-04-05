require 'pry'
require './lib/library.rb'
require 'date'

class Visitor   
    attr_accessor :receipt, :books_in_possesion
    attr_reader :library
    
    def initialize(attrs = {})
        @books_in_possesion = Array.new
        @library = attrs[:library]        
    end    
    
    def see_available                     
        all_books = @library.read_book_list
        availible_books = all_books.select { |book| book[:available] == true }             
    end

    def rent_the_book(args={})
        @library.pull_book(args)
        library.pulled_book[:available] == true ? update_data : book_unavailable
        @books_in_possesion << {title: library.pulled_book[:item][:title], return_date: library.pulled_book[:return_date]}        
        @receipt = {title: library.pulled_book[:item][:title], return_date: library.pulled_book[:return_date], date: Date.today.strftime('%d-%m-%y') }
    end

    def return_the_book(args={})
        @library.pull_book(args)
        library.pulled_book[:available] == false ? update_data : return_error
        @books_in_possesion.delete_if { |book| book[:title] == args[:title]}
    end
    
    private
    
    def book_unavailable
        raise 'Book is unavailable'
    end

    def return_error
        raise 'This book is already returned please contact staff'
    end
    
    def update_data
        @library.change_status
        @library.save_book_list        
    end
end