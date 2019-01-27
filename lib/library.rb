require 'yaml'
require './lib/books.yml'
require 'date' #not sure if we need these up here?

class Library
    attr_accessor: books

def initialize
    @books = []
    title("books.yml") #not sure how to link to yaml file
end    

def checkout(title, account)#we probably need more attributes but am using 2 for now
    case
    when unavailable?(title("books,yml"), account)
        {status:false, message: 'unavailable', date: Date.today}
    else
        perform_checkout(title("books.yml"), account)
    end   
    
private
    def unavailable(title"books.yml", account)    
        available=false
    end    

    if test
       
  
       
   end
        perform
    rescue => exception
        
    else
        
    end    

    RETURN_DATE_NEXT_MONTH = 30 #this might work ?

    attr_accessor :title, :author, :available, :return_date, :item 

    def initialize(available) #or something different?
        @title = 
        @author = #depends on title, how to set this?
        @available = :true
        @return_date = '1 month' # need to fix this. didn't it say one month? 
        @book = 
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
        Date.today.next_month? = # 1 month borrow time?
    end

    # def return_date  #this might work as well.
    #     now = DateTime.now
    #     DateTime.new(now.week)
    # end 

end