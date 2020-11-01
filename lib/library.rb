require 'date'
require 'yaml'

class Library
    STANDARD_VALIDITY_MONTH = 1
    attr_accessor :collection, :return_date

    def initialize()
        @collection = YAML.load_file('./lib/data.yml')
        @return_date = Date.today.next_month(1).strftime("%m/%y")
    end

    def load_data(collection) 
        collection = collection
    end

    def book_status(available)
        book_status = @collection.select{|collection|collection[:item][:title] == available}         
    end

    def title_search(search) 
        @collection = collection.select{|collection|collection[:item][:title].include? search}  
    end

    def author_search(search) 
        @collection = collection.select{|collection|collection[:item][:author].include? search}  
    end

    def book_return_date(return_date)
        Date.today.next_month(STANDARD_VALIDITY_MONTH).strftime('%m&%y')
    end

    def available(collection)
        collection = @collection.select { |item| item[:available] == true }
    end
end
