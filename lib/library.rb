require 'yaml'
require 'Date'

class Library
    attr_accessor :collection, :return_date

    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')
    end

    def book_available
        @collection.select { |obj| obj[:available] == true }
    end

    def book_search(obj)
        @collection.select { |obj| obj[:item][:title] == obj }
    end
    
    def book_lend_out(title)
        obj = @collection.detect { |obj| obj[:item][:title] == title }
        if obj[:available] == true
            then 
                obj[:available] = false
                obj[:return_date] = set_return_date
            return { message: 'The book is now approved for lending' } 
        end       
       File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def set_return_date
        Date.today.next_month
    end
end