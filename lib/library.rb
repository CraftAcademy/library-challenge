require 'date'
require 'yaml'

class Library
    attr_accessor :collection, :return_date

    def initialize()
        @collection = YAML.load_file('./lib/data.yml')
        @return_date = Date.today.next_month(1).strftime("%m/%y")
    end


    def load_data(collection) #1 ok
        collection = collection
    end

    def title_search(search) #3 ok
        @collection = collection.select{|collection|collection[:item][:title].include? search}  
    end

    def author_search(search) #4 ok
        @collection = collection.select{|collection|collection[:item][:author].include? search}  
    end

    def book_return_date(return_date)#5
        Date.today.next_month(STANDARD_VALIDITY_MONTH).strftime('%m&%y')
    end

    def available(collection)
        collection = @collection.select { |item| item[:available] == true }
    end
end
