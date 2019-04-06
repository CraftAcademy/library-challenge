

class Library

    attr_accessor :collection, :collection_books, :collection_available

    def initialize     
        @collection = YAML.load_file('./lib/data.yml')
    end

    def books
        @collection_books
        @collection_available 
    end

end
    

