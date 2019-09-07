require 'date'
require 'yaml'

class Book

    STANDARD_VALIDITY_MONTHS = 1
    
    def initialize 
        @author = :author
        @title = :title
        @return_date = 
        @status =

    end

    def set_return_date
        Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m')
    end
end