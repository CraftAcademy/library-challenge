require './lib/librarian.rb'
require './lib/reader.rb'


class Card
    attr_accessor :owner, :number

    def initialize(attrs = {})
        @number = rand(100000..999999)
        set_owner(attrs[:owner])
    end

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An owner for the library account card is required"
    end


end