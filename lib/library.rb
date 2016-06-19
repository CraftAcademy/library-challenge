require 'yaml'
require 'date'
require 'pry'

class Library
  attr_accessor:catalog

  def initialize
    @catalog = YAML.load_file('./lib/data.yml')
  end

  def list_available_books
      available_books = @catalog.select { |item| item[:available] == true }
  end
end
