require 'yaml'
require 'library.rb'

collection = data["deploy"][0]["username"]


class Person
    
    attr_accessor :books, :loaned, :collection, :return_date

    def initialize
        @books = list_of_books
        @loaned = person_has_books?
        @collection = collection_of_person
    end

    def collection    
        collection = YAML.load_file('./lib/data.yml')
    end

    def list_of_books
        collection = YAML.load_file('./lib/data.yml')
        collection = true
    end

    def person_has_books?
    end

    def collection_of_person
    collection[1]
    end

end