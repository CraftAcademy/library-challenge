require 'yaml'
require 'date'

class Library
    attr_accessor :catalogue, :exp_date

    def initialize 
        @catalogue = YAML.load_file('./lib/data.yml')
    end

    def catalogue
        @catalogue
    end
end