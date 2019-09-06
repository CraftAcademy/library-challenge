require 'date'

class Library
    attr_accessor :available, :return_date, :title, :author

    STANDARD_VALIDITY_MONTHS = 1

    def initialize
    @available = :true
    @return_date = set_return_date
    end
#case def with !true statements like atm.rb

    def borrow(title, author, available)
        case
        when not_available?(available)
            { status: false, message: 'book not available', date: Date.today }
        else
            checkout(args)
        end
    end

    def checkout(args)
        title = args[:title]
        collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def return(args)
        title = args[:title]
        collection[0][:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def set_return_date
        Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m')
    end
end