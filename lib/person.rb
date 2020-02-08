class Person
    
    attr_accessor :password, :borrowed_book, :due_date, :owner
    
    
    def initialize(attrs ={})
        @password = rand(1000..9999)
        @due_date = set_due_date?()
        @borrowed_book = :title
        set_owner(attrs[:owner])
    end


    def set_due_date?
        Date.today + 30 ('%m/%d')
    end


    private

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end

end


