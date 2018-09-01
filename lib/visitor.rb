require 'date'
require 'yaml'
    
class Visitor
    attr_accessor :name, :bookshelf, :available_books, :available_titles
    
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @bookshelf = []
        @available_books = []
        @available_titles = []
    end

    # def check_collection
    #     @collection = YAML.load_file('./lib/data.yml')
    # end

    # def check_availability
    #     @collection = YAML.load_file('./lib/data.yml')
    #     @available_books = @collection.select { |obj| obj[:available] == true  }
    # end

    # def check_available_titles
    #     @available_titles = self.available_books.map {|book| book.values[0]}
    end
end

private

def set_name(obj)
    obj == nil ?  missing_name : @name = obj
end

def missing_name
    raise ArgumentError, "A name is required"
end

