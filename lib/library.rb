require 'date'
require 'yaml'

class Library

    attr_accessor :collection

    def initialize
        @collection = read_file
    end

    def read_file
        YAML.load_file('./lib/data.yml')
    end


end
