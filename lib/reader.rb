require './lib/librarycard.rb'
class Reader

    attr_accessor :name, :library_card, :books

    def initialize(attrs = {})
        @books = 0
        set_name(attrs[:name])
        @library_card = nil
    end

    def reader_checkout(title)
        # Dash TODO (test specs first!)
    end

    def reader_return(title)
        # Dash TODO (test specs first!)
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