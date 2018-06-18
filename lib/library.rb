require 'yaml'
require 'date'

class Library

    attr_accessor :items, :available
    
        

    def initialize
        @items =  YAML.load_file('./lib/data.yml')
    end

    def check_out
        case
        when book_unavailable
            { status: false, message: 'Book is unavailable' }
        when book_is_not_returned_before_return_date
            { status: false, message: 'You have books that is not checked in before expected return date', date: Date.today }
        else check_out_yes

        end
    end

    def check_out_yes(items)
        @items=[][:available] = false
        yaml_update
    end

    private

    def todays_date
    Date.strftime.now('%d/%m')
    end

    def new_return_date
    Datetime.now + 30.days
    end

   def yaml_update
    File.open('./lib/data.yml', 'w') { |f| f.write items.to_yaml }
    end

    def book_unavailable
        @items = [available = false]
    end

    def collection_of_books (item)
            write = File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    end

    def write (number)

    end


end