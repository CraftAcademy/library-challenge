require 'yaml'
require 'date'
require './lib/library.rb'

class Visitor 
    

    def initialize 
       @catalogue = YAML.load_file('./lib/data.yml')
    end

   




end