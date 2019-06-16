
class Visitor

    attr_accessor :name, :visitor_account_status

    def initialize
        @name = name
        @visitor_account_status = :active
        @return_date = Date.today.next_month.strftime('%d/%m')
    end

    def name
        name = nil ? missing_name : name
    end

    def missing_name
        raise 'You are not able to borrow books in this library'
    end

    def return_date
        Date.today.next_month.strfime('%d/%m')
    end

    def search(book)
        books = YAML.load_file('./lib/inventory.yml')
        "You can borrow the book but fuck you if u ruin it"
    end
    
    def deactivate
        @visitor_account_status = :deactivated
    end
end

