require 'yaml'
require 'date'

class Library

  attr_accessor :collection, :available_books

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
    @available_books = check_for_available_books
  end

  def check_for_available_books
    @collection.select { |item| item[:available] == true }
  end

end
