require 'yaml'

class Person

    attr_accessor :person_books_available

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end
    
    def person_books_available(library)
        # We know this isn't working properly yet still getting a clean test.
        @collection.select { |obj| obj[:available] == true }
    end
end