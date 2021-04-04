require 'date'

class Customer
    attr_accessor :rented_books
    
    def initialize
        @rented_books = []
    end

end