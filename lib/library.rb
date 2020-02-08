require 'yaml'
require './lib/person.rb'
items = YAML.load_file('./lib/data.yml')

class Library
    attr_accessor :books



end