
class Visitor

    attr_accessor :name

    def initialize(attrs = {})
        @name = set_name(attrs[:name])
    end

    def set_name(name)
        @name == nil ? missing_name : name
    end

    def missing_name
        raise 'You are not able to borrow books in this library'
    end
end

