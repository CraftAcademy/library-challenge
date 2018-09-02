class Borrower
    attr_accessor :name, :borrowed_books, :id, :status 

    def initialize(name="")
        name.empty? ? provide_name : @name = name
        @borrowed_books = []
        @id = nil
        @status = nil        
    end

    private

    def provide_name
        raise ArgumentError, 'You must provide a name when you create a Borrower'
    end
end