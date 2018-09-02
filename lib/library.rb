require 'yaml'
require './lib/visitor.rb'
require 'date'

class Library
    
    attr_accessor :collection
    
    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')
    end

    def list_availability
        @collection.select { |obj| obj[:available] == true  }
    end

    def checkout(title)
        book = @collection.detect { |av| av[:item][:title].include? title }
        case
        when title_available?(book) == false
            title_unavailable(book) 
        else
            update_availability_checkout(book)
            update_return_date_checkout(book)
            File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
            return book
        end
    end 

    def checkin(title)
        book = @collection.detect { |av| av[:item][:title].include? title }
        update_availability_checkin(book)
        update_return_date_checkin(book)
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
        {title: title, message: 'Book now available'}
    end

    private

    def title_available?(book)
        @collection.any? { |obj| obj[:item][:title] == book[:item][:title] && obj[:available] == true}
    end  
    
    def title_unavailable(book)
        "#{book[:item][:title]} is currently not available"
    end

    def update_availability_checkout(book)
        book[:available] = false
    end

    def update_return_date_checkout(book)
        book[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
    end

    def update_availability_checkin(book)
        book[:available] = true
    end

    def update_return_date_checkin(book)
        book[:return_date] = nil
    end

end
