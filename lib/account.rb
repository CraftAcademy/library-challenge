
class Account
    
    attr_accessor :password, :borrowed_books, :owner
    
    
    def initialize(attrs ={})
        @password = rand(1000..9999)
        @borrowed_books = 0
        set_owner(attrs[:owner])
    end

    private

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end

end