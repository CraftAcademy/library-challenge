require 'yaml'
require 'date'

class Person
    attr_accessor  :name
    def initialize(attrs = {})
        @name = 'sb'
    end

    def return_date()
        Date.today.next_month
    end
    
end