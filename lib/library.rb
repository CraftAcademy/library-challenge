 require 'yaml'

class Library
  attr_reader :list

  def initialize
    @list = YAML.load_file('./lib/data.yml')
  end
end
