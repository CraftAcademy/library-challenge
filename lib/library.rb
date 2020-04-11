require "date"
require "yaml"
require "./lib/book.rb"

class Library

    attr_accessor :collection

    def initialize(attr={})
        @collection = set_collection
    end
 
    def set_collection
        YAML.load_file('./lib/data.yml').each {|rawdata|  Book.new(rawdata) }
    end


    def list_collection
        @collection
    end

    def find_title
    end

    def find_author
    end

    def find_category
    end

    def find_available
    end

    def find_unavailable
    end






end