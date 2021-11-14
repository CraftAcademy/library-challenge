class Books 

    attr_accessor :title, :author, :availability, :borrower, :return_date
    def initialize
        @title = "Four Hour Work Week"
        @author = "Tim Ferriss"
        @status = false 
        @borrower = nil 
        @return_date = Date.today 
    end


    
end 

