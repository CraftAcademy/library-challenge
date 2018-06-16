require 'yaml'
require 'date'

class Library
    attr_accessor :inventory

    def initialize
        @inventory = YAML.load_file('./lib/data.yml')
    end

end

