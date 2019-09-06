require 'yaml'

class Library

    def collection
        collection = YAML.load_file('./lib/data.yml') 
    end
end