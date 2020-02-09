require 'yaml'
require 'date'

class Library
    attr_accessor :collection_books, :available

    BORROWING_PERIOD_DAYS = 30
    
    def initialize
        @collection_books = YAML.load_file('./lib/data.yml')
    end

    ## select, In this specific case, it will return the array of 
    ##all hashes which contain a true :available key. 

    def books_is_available?
        collection_books.select {|b| b[:available]}
    end

    def books_is_unavailable?
        collection_books.select {|b| b[:available].eql? false }
    end

    def search_book_title(user_input)
        collection_books.select{|b| b[:item][:title].include? "#{user_input}"}
    end

    def search_book_author(user_input)
        collection_books.select{|b| b[:item][:author].include? "#{user_input}"}
    end

    def time_out
       bring_back = Date.today + BORROWING_PERIOD_DAYS
       return bring_back
    end

end

private


