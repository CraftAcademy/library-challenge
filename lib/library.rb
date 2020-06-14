require 'yaml'
require 'date'

class Library
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

        def book_checkout
            File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        end


    def books
        books = 
            collection[0][:item][:title],
            collection[1][:item][:title],
            collection[2][:item][:title],
            collection[3][:item][:title],
            collection[4][:item][:title]
    end

    def exp_return_date
        Date.today.next_month.strftime('%d/%m/%y')
    end

    def availability
        collection.select { |obj| obj[:available] == true }
    end

    def not_available
        collection.select { |obj| obj[:return_date] != nil }
    end

end
