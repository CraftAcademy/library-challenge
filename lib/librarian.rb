require 'date'
require 'yaml'

class Librarian
    attr_accessor :list

    def initialize
        @list = YAML.load_file('./lib/data.yml')
        
    end

    def check_availability(title)
        list
    
end
