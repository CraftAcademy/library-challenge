require 'yaml'

class Library
    attr_accessor :collection

    def initialize
        @collection = YAML.load_file('./lib/data.yml')
    end

    def book
        book = collection[0][:item][:title]
    end

end
