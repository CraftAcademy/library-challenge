require 'yaml'
require 'date'

class Person
    attr_accessor :books_person

    def initialize
        @books_person = []
    end

end