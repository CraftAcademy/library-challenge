require 'date' # This allows dates to work

class Account
    attr_accessor :owner, :borrowed_books, :account_status

    STANDARD_VALIDITY_YRS = 10 # Library card expiration date

    def initialize (attrs = {})
        @owner = set_owner(attrs[:owner])
        @borrowed_books = # List of borrowed books
        @account_status = :active
    end

    def set_account_status # The account deactivates in 10 years from "today"
        Date.today.ten_years(STANDARD_VALIDITY_YRS).strftime('%d/%m/%y')
    end
    
    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end

    private

    def deactivate_account # Deactivates the account based on event
        @account_status = :deactivated
    end

end