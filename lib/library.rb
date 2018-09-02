require 'yaml'
require './lib/visitor.rb'

class Library
    
    attr_accessor :collection
    
    def initialize(attrs = {})
        @collection = YAML.load_file('./lib/data.yml')
    end

    def list_availability
        @collection.select { |obj| obj[:available] == true  }
    end
    
    def check_availability(title)
        title_available?(title)
    end

    def checkout(title)
        case
        when title_available?(title) == false
            title_unavailable(title) 
        else
            update_availability_checkout(title)
            update_return_date_checkout(title)
            {title: title, message: 'Book now checked out', 
              date_of_return: Date.today.next_month(1).strftime('%d/%m/%y')}
        end
    end 

    def checkin(title)
        update_availability_checkin(title)
        update_return_date_checkin(title)
        {title: title, message: 'Book now available'}
    end

    private

    def title_available?(title)
        @collection.any? { |obj| obj[:item][:title] == title && obj[:available] == true}
    end  
    
    def title_unavailable(title)
        "#{title} is currently not available"
    end

    def update_availability_checkout(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
        (@collection.detect { |av| av[:item][:title].include? title })[:available]
    end

    def update_return_date_checkout(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date]
    end

    def update_availability_checkin(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:available] = true
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
        (@collection.detect { |av| av[:item][:title].include? title })[:available]
    end

    def update_return_date_checkin(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date] = nil
        File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date]
    end

end
