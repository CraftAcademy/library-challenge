require 'yaml'

class Library
    attr_accessor :book_collection

    def initialize
        @book_collection = YAML.load_file('./lib/data.yml')
    end

    def show_collection
        collection = []
        @book_collection.each do |key,value|
            collection << key[:item]
        end
        collection
    end
end