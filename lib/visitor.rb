require 'date'
require 'yaml'
require './lib/library.rb'
    
class Visitor
    attr_accessor :name, :bookshelf, :collection
    
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @bookshelf = []
        @collection = YAML.load_file('./lib/data.yml')
    end

    def list_availability
        @available_books = @collection.select { |obj| obj[:available] == true  }
        @available_books.map {|book| book.values[0]}
    end

    def view_bookshelf
        @bookshelf
    end

    def request_checkout(title)
        #need to call checkout method on title (from library)
        checkout(title)
        update_bookshelf
    end

    def request_checkin(title)
        #need to call checkin method on title (from library)
        checkin(title)
        update_bookshelf
    end

    def update_bookshelf()
        #need to use method to make these variables equal
        @bookshelf = @visitor_bookshelf
    end

    def check_return_date(title)
        (@collection.detect { |av| av[:item][:title].include? title })[:return_date]
    end

    private

    def set_name(obj)
        obj == nil ?  missing_name : @name = obj
    end

    def missing_name
        raise ArgumentError, "A name is required"
    end

end
