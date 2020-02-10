require './lib/library.rb'
class Person

    attr_accessor :person, :username, :personal_id

    def initialize
        @username = nil
        @personal_id = nil
        @loaned_books = []
    end

    def set_username(username)
        @username = username
    end

    def set_personal_id(input_personal_id)
        @personal_id = input_personal_id
    end

    def loan_book(book_to_loan, username)
        self.lend_book(book_to_loan, username)
    end
    
end