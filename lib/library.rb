require 'yaml'
require 'Date'

class Library
    attr_accessor :collection, :books_available, :return_date, :title

    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')

    end

    def books_available
        collection.select { |book| book[:available] == true }
    end

    def search(book)
        collection.select { |book| book[:item][:title] == book }
    end
    
    def lend_out_book(title)
        book = @collection.detect { |book| book[:item][:title] == title }
       if book[:available] == true
       then 
            book[:available] = false
            book[:return_date] = returndate
       return { message: 'successfully booked'} 
       end       
     File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def returndate
        Date.today.next_month
    end

end