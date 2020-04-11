class Library
    attr_accessor :collection

    def initialize
        collection_present
        @collection = load_collection
    end
    def collection_present
       if YAML.load_file('./lib/data.yml')
       return true 
       end
    end
    def load_collection
        YAML.load_file('./lib/data.yml')
    end
    def search(title)
        collection.select { |obj| obj[:item][:title].include?(title) }
    end
end
