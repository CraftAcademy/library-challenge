require 'date'

class Account
    attr_accessor :owner, :account_status, :id

    STANDARD_VALIDITY_YRS = 10

    def initialize (attrs = {})
        @owner = set_owner(attrs[:owner])
        @account_status = :active
        @id = rand(1000..9999)
    end

    def set_account_status
        Date.today.ten_years(STANDARD_VALIDITY_YRS).strftime('%d/%m/%y')
    end

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end

    private

    def deactivate_account
        @account_status = :deactivated
    end

end