require 'yaml'

class Library

    attr_accessor :list

    def initialize
        @list = YAML.load_file('./lib/data.yml')
        
    end

    


end