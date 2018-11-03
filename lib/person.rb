require 'date'
require 'yaml'

class Person

    attr_accessor :name, :rented_book

    def initialize (arg ={})
        @name
        @rented_book = {}
        set_name(arg[:name])
    end

    def set_name(name)
        name == nil ? missing_name : @name = name
    end

    def missing_name
        raise 'Missing name'
    end
end