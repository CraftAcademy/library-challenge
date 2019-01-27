require 'yaml'

class Library
    attr_accessor :list, :available  
    def initialize(attrs = {})
        @list = YAML.load_file('./lib/data.yml')
        @available = true
    end
end