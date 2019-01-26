require 'yaml'

class Library
    attr_accessor :title, :author, :available, :return_date, :item 

    def initialize(available) #or something different?
        @title = 
        @author = 
        @available =
        @return_date =
        @item = 
    end

    def return_date
        Date.today = #something 
    end

    # class Book
    #     attr_accessor 
    #     def #?
    # end
    private

    def return_date
        return_date = '%m/%y' # unsure about this part.
    end

end