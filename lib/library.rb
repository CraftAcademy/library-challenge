require "date"
require "yaml"

class Library

    attr_accessor :collection

    def initialize(attr={})
        @collection = YAML.load_file("./lib/data.yml")
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