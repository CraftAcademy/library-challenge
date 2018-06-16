require 'yaml'
require 'date'

class Library

    attr_accessor :items
    
        

    def initialize
        @items =  YAML.load_file('./lib/data.yml')
    end

    def check_out
        case
        when book_unavailable
            { status: false, message: 'book is unavailable', date: Date.today }
        else 
          check_out_yes
        end
    end

    private

    def check_out_yes

    end

    def book_unavailable
        YAML.load_file('./lib/data.yml')
        [available = false]
    end

        def list_of_books 
        @items = YAML.load_file('./lib/data.yml')
        collection = true
        end

        def collection_of_books (item)
            write = File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        end

        def write (number)
        # collection[][:available] = false
        collection_of_books = [available][return_date]
        end

        #data = YAML.load_file('./lib/data.yml')
        #available = data["item"][2]["available"]


end

