require 'yaml'
require 'date'

class Library
    attr_accessor :catalog, :return_date, :books_checked_out

    STANDARD_TIME_MONTH = 1

    def initialize
        @catalog = YAML.load_file('./lib/data.yml')
        @return_date = set_return_date()
    end
   #User can search
    def author_search(user_search)
        @book = catalog.select { |obj| obj[:item][:author].include? user_search }
    end

    def title_search(user_search)
        @book = catalog.select { |obj| obj[:item][:title].include? user_search }
    end

    
    #We want to first find the book the user wants to check out
    def book_to_checkout(user_search)
        books_checked_out = []
        books_checked_out << @catalog.detect { |obj| obj[:item][:title] == user_search }
    end
    
    # we then want to check the book's availability
    # we then want an OR statement to either checkout book or say book is not available (maybe do in one step?)
    def book_checkout(user_search)
        availablity = book_to_checkout(user_search)[0][:available]
        availablity ? checkout(user_search) : 'Checkout incomplete, book unavailable.'
    end
    
    # then if the book is available we want to 'checkout' by updating the books availability and return_date and message to user
    def checkout_process(user_search)
        #update availability
        book_to_checkout(user_search)[0][:available] = false
        #update return date
        book_to_checkout(user_search)[0][:return_date] = @return_date
        #push to yml
        File.open('./lib/data.yml', 'w') { |f| f.write catalog.to_yaml }
        #message to user
        { message: 'Checkout complete', return_date: set_return_date } 
    end
    
    def set_return_date
        Date.today.next_month(STANDARD_TIME_MONTH).strftime('%D')
    end   
      



end