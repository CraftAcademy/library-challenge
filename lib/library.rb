class Library

  attr_accessor :catalogue #books

  def initialize
    @catalog = YAML.load_file('./lib/data.yml')
    require 'yaml'
  end
end
