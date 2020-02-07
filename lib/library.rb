require 'yaml'

class Library 
    attr_accessor :collection

    STANDARD_LENDING_PERIOD_IN_DAYS = 30

    def collection
        collection = YAML.load_file('./lib/data.yml')
    end

end