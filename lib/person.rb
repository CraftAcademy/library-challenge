require "date"  #irb syntax for initializing calsses ATM challenge: "> person = Person.new({:name => "Mathias"})"
require "./lib/library_fs.rb"

# mathias = Person.new({:account => "mlj"})


class Person
    attr_accessor :account, :on_hand

    def initialize(args = {}) 
        create_account(args [:account])
        @on_hand = []

    end

    def borrow_book(title, library)
        library.borrow_book(title, self)
    end

    def browse_book(library)
        library.book_availible
    end

    private

    def missing_account
        raise "An account is required"
    end

    def create_account(obj)
        obj == nil ? missing_account : @account = obj
    end

end