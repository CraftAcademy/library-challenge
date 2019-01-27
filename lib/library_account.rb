class Library_account

    attr_accessor :account_status, :user

    def initialize(attrs = {})
        @account_status = :active
        @set_borrower(attrs[:borrower)
    end

    def account_status(library_account)
        library_account.account_status = :active
    end

    def set_borrower(obj)
        obj == nil ? missing_borrower : @borrower = obj
    end