require 

class Library
    attr_accessor: :books

collection = YAML.load_file "books.yml"
subject = data["Book_list"]

def initialize
    @item = []
    @title #not sure how to link to yaml file
end    

def checkout(title, library_account)#we probably need more attributes but am using 2 for now
    collection.select { |obj| obj[:item][:title].include?"Hallows"}
    case # do we need case here?
    when unavailable?(title, account)
        {status:false, message: 'unavailable', date: Date.today}
    else
        perform_checkout(title("books.yml"), account)
    end   
    
    

    def unavailable(title, account)    
        available=false
    end    

    if test


    end
        perform
    rescue => exception
        #not sure what this is?
        
    else
        
    end    

    RETURN_DATE_NEXT_MONTH = 30 #this might work ?

    attr_accessor :title, :author, :available, :return_date, :book 

    def initialize(available) #or something different?
        @title = 
        @author = #depends on title, how to set this?
        @available = :true
        @return_date = '1 month' # need to fix this. didn't it say one month? 
        @book = 
    end


    def title
        title = :title #working on how to call this 
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