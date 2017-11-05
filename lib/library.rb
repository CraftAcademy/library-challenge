require 'yaml'

class Library
  attr_accessor :collection, :available

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def books
    @collection = []
  end

  def books_available
    @collection.select { |obj| obj[:available] == true }
  end
end
