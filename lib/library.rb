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

    def show_title_author 
        for i in 0..4
            puts catalogue[i][:item]
        end
    end   
end
