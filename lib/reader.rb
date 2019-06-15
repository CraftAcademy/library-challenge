require './lib/librarycard.rb'
class Reader

    attr_accessor :name, :library_card

    def initialize(attrs = {})
        set_name(attrs[:name])
        @library_card = nil
    end
    
    def set_name(obj)
        obj == nil ? missing_name : @name = obj
    end

    def missing_name
        raise "A name is required"
    end

    def create_library_card
        @library_card = Card.new(owner: self)
    end
end