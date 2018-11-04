require 'yaml'

class Person

    attr_accessor :person_books_available

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end
    
    def person_books_available(library)
        @collection.select { |obj| obj[:available] == true }
        #@collection.select { |obj| obj[:item][:title] == library }
        #library.books_available
    end
end