require 'yaml'
require 'date'

class Library

    attr_accessor :books
    @books

    def initialize
        @books = list_of_books
    end

        def list_of_books
        collection = YAML.load_file('./lib/data.yml')
        collection = true
        end


end