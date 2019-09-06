

class Book  
    STANDARD_VALIDITY_DAYS = 30
    attr_accessor :author, :title, :return_date

    def initialize
        @author = :author
        @title = :title
        @return_date = set_return_date
    end

    private
    def set_return_date
        Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%y')
    end
end
