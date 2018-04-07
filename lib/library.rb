require 'yaml'

class Library

  def initialize
    list
  end

  def list
    collection = YAML.load_file('./lib/data.yml')
  end

end
