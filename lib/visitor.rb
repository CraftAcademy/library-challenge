require './lib/library.rb'
require 'date'

class Visitor

    attr_accessor :name, :visitor_account_status

    def initialize
        @name = name
        @visitor_account_status = :active
        
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
        if book[:available] = true
        "It's your lucky day! This book is in our library."
        else book[:available] = nil
        "Unfortunally we don't have that book."
        end
    end 

    def borrow_book(title)
        book = YAML.load_file('./lib/inventory.yml')
        if book[:available] == true
            borrow(title)
        else
        book[:available] == false
        "Im sorry, its not here"
        end
    end
end 





# def deactivate
    #     @visitor_account_status = :deactivated
    # end


