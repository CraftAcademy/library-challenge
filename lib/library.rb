require 'yaml'
require 'pry'

class Library 
    RENTAL_TIME = 30
    attr_accessor :book_list, :pulled_book 

    def initialize
        @book_list
        @pulled_book
    end

    def read_book_list
        @book_list = YAML.load_file('./lib/books.yml')
    end

    def pull_book(args = {})       
        args[:title] == nil ? title_missing_error : return_book(args[:title])
    end

    def change_status
      @pulled_book[:available] == false ? change_status_to_true : change_status_to_false 

    end
    
    private

    def title_missing_error
        raise RuntimeError, "Specify the title of book to pull"
    end

    def return_book(title)
        @pulled_book = @book_list.detect { |book| book[:item][:title] == title }
    end

    def change_status_to_true
      @pulled_book[:available] = true
      @pulled_book[:return_date] = nil
    end
    
    def change_status_to_false
      #binding.pry
      @pulled_book[:available] = false
      @pulled_book[:return_date] = Date.today.next_day(RENTAL_TIME).strftime('%d-%m-%y')
    end


end