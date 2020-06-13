require 'yaml'
require 'date'

class Library
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

    def book
        book = collection[0][:item][:title]
    end

    def return_date
        Date.today.next_month.strftime('%d/%m/%y')
    end

    def availability
        collection.select { |obj| obj[:available] == true }
    end
end
