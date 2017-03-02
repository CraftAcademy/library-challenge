require 'yaml'
require 'date'
require 'pry'

class Person

attr_accessor :books

def initialize
  @books = YAML.load_file('./lib/person.yml')
end
end
