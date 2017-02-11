require 'yaml'
require 'date'

class Library

attr_accessor :item

def initialize
  @list = YAML.load_file('./lib/data.yml')
end

end
