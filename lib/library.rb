require 'yaml'

class Library
    attr_accessor :collection, :available_books
    def initialize
        @collection = YAML.load_file('./lib/data.yml')
        @available_books = show_available_books
    end
end

def show_available_books
    available_books = @collection.select { |obj| obj[:available] == true }
    available_books
end
