require 'yaml'
require 'date'

class Library
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

        def book_checkout
            collection[0][:available] = false
            File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        end
        
    def book_list
        book_list = 
        collection[0][:item],
        collection[1][:item],
        collection[2][:item],
        collection[3][:item],
        collection[4][:item]
    end

    def exp_return_date
        Date.today.next_month.strftime('%d/%m/%y')
    end

    def availability
        collection.select { |book| book[:available] == true }
    end

    def not_available
        collection.select { |book| book[:return_date] != nil }
    end
end
