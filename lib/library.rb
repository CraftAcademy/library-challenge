class Library
    STANDARD_VALIDITY_DAYS = 30
    attr_accessor :collection, :person

    def initialize (attrs = {})
        @collection = YAML.load_file('./lib/data.yml') 
        @person = person
    end

    
    def availability
       @books[:available] == true ? check_out : unavailable_book

    end

    def set_return_date
        if check_out == true then
            book[:return_date] = Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%Y')
        end
    end
end








