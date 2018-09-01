require 'date'
require 'yaml'
    
class Visitor

    attr_accessor :name, :bookshelf
    
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @bookshelf = []
    end


end

private

def set_name(obj)
    obj == nil ?  missing_name : @name = obj
end

def missing_name
    raise ArgumentError, "A name is required"
end