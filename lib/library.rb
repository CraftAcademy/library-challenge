require 'yaml'
require 'date'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
  end

  def show_library
    @books
  end
end
