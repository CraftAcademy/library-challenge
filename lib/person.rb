require "yaml"

class Person
  
  attr_accessor :list

  def initialize
    @list =  YAML.load_file('./lib/person_list.yml')
  end

end
