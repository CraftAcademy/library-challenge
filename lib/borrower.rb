class Borrower
    attr_accessor :name, :borrowed_books 

    def initialize(name="")
        name.empty? ? provide_name : @name = name
        @borrowed_books = {}
    end

    private

    def provide_name
        raise ArgumentError, 'You must provide a name when you create a Borrower'
    end
end