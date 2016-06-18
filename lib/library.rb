class Library

  attr_accessor :catalog

  def initialize
    @catalog = YAML.load_file('./lib/data.yml')
    require 'yaml'
  end


  private


end
