
class Library

    attr_accessor :collection, :collection_books, :collection_available

    def initialize     
        @collection = YAML.load_file('./lib/data.yml')
    end

    def books
        @collection_books
        @collection_available 
    end

    def checkout
        @collection[0][:available] = false
        File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
    end



end
    

