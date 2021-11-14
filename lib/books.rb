require 'date'
class Books 
    STANDARD_BORROWING = 30

    attr_accessor :title, :author, :availability, :borrower, :return_date
    def initialize
        @title = "Four Hour Work Week"
        @author = "Tim Ferriss"
        @status = false 
        @borrower = nil 
        @return_date = set_return_date
    end
     

    def set_return_date
        Date.today.next_day(STANDARD_BORROWING).strftime('%d/%m/%y')
    end


end 

