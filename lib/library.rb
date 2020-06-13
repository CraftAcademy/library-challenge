require 'yaml'

class Library
    attr_accessor :catalogue

    def initialize
        @catalogue = YAML.load_file('./lib/data.yml')
        
    end
end

