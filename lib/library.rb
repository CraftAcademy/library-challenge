class Library
  attr_accessor :catalog

  def initialize
    @catalog = YAML.load_file('./lib/catalog.yml')
  end

end