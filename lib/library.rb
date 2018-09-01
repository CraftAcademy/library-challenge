require 'yaml'
require 'Date'

class Library
    attr_accessor :collection, :books_available

    def initialize()
        @collection = YAML.load_file('./lib/data.yml')
    end

    def books_available
        collection.select { |book| book[:available] = true }
    end

    

end