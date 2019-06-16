require './lib/library.rb'
require 'date'

class Visitor

    attr_accessor :name, :visitor_account_status

    def initialize
        @name = name
        @visitor_account_status = :active
        # @return_date = Date.today.next_month.strftime('%d/%m')
    end

    def name
        name = nil ? missing_name : name
    end

    def missing_name
        raise 'You are not able to borrow books in this library'
    end

    def return_date
        Date.today.next_month(1).strfime('%d/%m')
    end

    def search(book)
        book = YAML.load_file('./lib/inventory.yml')
        if book = [:available]
        "It's your lucky day! This book is in our library."
        else book
        "Unfortunally we don't have that book."
        end
    end 

    def borrow_book(book)
        book = YAML.load_file('./lib/inventory.yml')
        if book[:available] == false
        else
        book[:available] == true
        book[:return_date] == return_date
        "You have just borrowed an awesome book! Please don't forget to return it."
        end
    end
end 





# def deactivate
    #     @visitor_account_status = :deactivated
    # end


