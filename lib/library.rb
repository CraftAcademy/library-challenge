require 'yaml'
require './lib/visitor.rb'

class Library
    
    STANDARD_RETURN_PERIOD_MONTHS = 1

    attr_accessor :collection, :visitor_bookshelf
    
    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')
        @visitor_bookshelf = []
    end

    # def create_visitor(name)
    #     @visitor = Visitor.new(name)
    # end

    def collection_list
        collection = @collection
    end

    def list_availability
        @collection.select { |obj| obj[:available] == true  }
    end
    
    def check_availability(title)
        title_available?(title)
    end
    
    def set_return_date
        @return_date = Date.today.next_month(STANDARD_RETURN_PERIOD_MONTHS).strftime('%d/%m/%y')
    end

    def checkout(title)
        case
        when title_available?(title) == false
            title_unavailable(title) 
            
            return
        else
            update_availability(title)
            update_return_date(title)
            @visitor_bookshelf << @collection.detect { |av| av[:item][:title].include? title }
            {title: title, message: 'Book now checked out', date_of_return: Date.today.next_month(1).strftime('%d/%m/%y')}
        end
    end 

    private

    def title_available?(title)
        @collection.any? { |obj| obj[:item][:title] == title && obj[:available] == true}
    end  
    
    def perform_checkout(title)
        {title: title, message: 'Book checked out', date_of_return: Date.today.next_month(1).strftime('%d/%m/%y')}
    end  

    def title_unavailable(title)
        raise "#{title} is currently not available"
    end

    def update_availability(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
        (@collection.detect { |av| av[:item][:title].include? title })[:available]
    end

    def update_return_date(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date]
    end

end 

# def title_availabilty
#     title_info[:available] == true ? available_book(title_info[:item][:title]) : unavailable_book(title_info[:item][:title])
# end


# testing ground at the moment

# Search for an item based on title
    # def title_search(search_term)
    #     title_info = collection.detect { |av| av[:item][:title].include? search_term }
    # end



    # def available_book(avail_title)
    #     puts "#{avail_title} is available!"
    # end

    # def unavailable_book(avail_title)
    #     puts "#{avail_title} is unavailable!"
    # end

    # OR

    # def title_availability_search(search_word)
    #     title_return = collection.detect { |av| av[:item][:title].include? search_word }
    #     if title_return[:available] = true
    #         puts "#{title_return[:item][:title]} is available!"
    #     else
    #         puts "#{title_return[:item][:title]} is not available!"
    #     end
    # end


