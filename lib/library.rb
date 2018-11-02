require 'yaml'

class Library
    attr_accessor :collection

    def initialize 
        @collection = YAML.load(File.read('./lib/data.yml'))
    end

end