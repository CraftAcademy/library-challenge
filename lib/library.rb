require 'yaml'

class Library

  attr_reader :books

  def initialize
    @books = YAML.load_file('./lib/collection.yml')
  end
end
