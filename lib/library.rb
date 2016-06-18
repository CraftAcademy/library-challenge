class Library
  
  attr_accessor :catalogue #books

  def initialize
    @caralogue = YAML.load_file('./lib/data.yml')
    require 'yaml'
  end
end
