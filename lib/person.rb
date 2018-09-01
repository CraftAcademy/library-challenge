require 'yaml'
require 'date'

class Person
    attr_accessor :name, :date

    def initialize(attrs = {})
        @name = person_name(attrs[:name])
        @date = Date.today


    # def book_shelf()
    end
end
    