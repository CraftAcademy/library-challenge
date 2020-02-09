class Person

    attr_accessor :person, :username, :personal_id,

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

    def loan_book(args = {})
        @account == nil ? missing_account : withdraw_funds(args)
    end
    
    def make_loan_of_book(args)
        #args[:library] == nil ? missing_library : library = args[:library]
        username = @username
        response = library.lend_book(book, username)
        response[:status] == true ? make_loan_of_book(book, username) : response
    end

    def missing_library
        raise RuntimeError, 'A Library is required'
    end
    

end