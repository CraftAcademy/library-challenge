require 'date'
require 'yaml'

class Book
    attr_accessor :author, :title, :return_date, :status

    STANDARD_VALIDITY_MONTHS = 1
    
    def initialize 
        @author = :author
        @title = :title
        @return_date = set_return_date
        @status = :available
    end

    def set_return_date
        Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m')
    end

    def book_unavailable?
        @status = :unavailable
    end
end