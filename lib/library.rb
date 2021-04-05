require 'yaml'
require 'pry'
require 'date'

class Library 
    RENTAL_TIME = 30
    attr_accessor :book_list, :pulled_book 
    attr_reader :thirty_days_later, :visitor

    def initialize
        @book_list
        @pulled_book
        @thirty_days_later = Date.today.next_day(30).strftime('%d-%m-%y')
    end

    def new_visitor
        @visitor = Visitor.new({library: self})
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

    def save_book_list
        File.open('./lib/books.yml', 'w') { |file| file.write @book_list.to_yaml }
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
      @book_list.map { |book| book[:item][:title] == @pulled_book[:item][:title] ? @pulled_book : book }
    end    
    
    def change_status_to_false
      @pulled_book[:available] = false
      @pulled_book[:return_date] = Date.today.next_day(RENTAL_TIME).strftime('%d-%m-%y')
      @book_list.map { |book| book[:item][:title] == @pulled_book[:item][:title] ? @pulled_book : book }
    end


end