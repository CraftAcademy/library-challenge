require 'yaml'
require './lib/books.yml'

class Library

    RETURN_DATE_NEXT_WEEK = 7 #this might work ?

    attr_accessor :title, :author, :available, :return_date, :item 

    def initialize(available) #or something different?
        @title = 
        @author = #depends on title, how to set this?
        @available = :true
        @return_date = '1 week' # need to fix this. 
        @item = 
    end


    def title
        title = :title
    end

    # class Book
    #     attr_accessor 
    #     def something?
    # end

    private

    def return_date
        Date.today.next_week? = # 1 week borrow time?
    end

    # def return_date  #this might work as well.
    #     now = DateTime.now
    #     DateTime.new(now.week)
    # end 

end