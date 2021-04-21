require 'date'

class Customer
    attr_accessor :name, :books 
    
    def initialize (name)
        @name = name
        @books = []
    end

    def borrow request
        missing_keeper request[:keeper]
        missing_books request[:title]
        result = request[:keeper].check_out(request[:title])
        if result[:status] == true then
            @books << result[:book]
        end
        result[:message]
    end

    def missing_keeper keeper
        raise 'Required keeper' if keeper == nil
    end

    def missing_books list
       raise 'Requred list of books' if list == nil
    end

end



    
