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

    def request_checkout(title)
        Library.checkout(title)
    end

    def update_bookshelf
        @bookshelf = library.visitor_bookshelf
    end

    private

    def set_name(obj)
        obj == nil ?  missing_name : @name = obj
    end

    def missing_name
        raise ArgumentError, "A name is required"
    end

end
