require 'yaml'

class Library
    STANDARD_VALIDITY_DAYS = 30
    
    def availability(book = {})
        book[:available] == true ? check_out : unavailable_book          
    end

    #missing check_out and unavailable_book method

    def set_return_date
        if check_out == true then
            book[:return_date] = Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%Y')
        end
    end


end





