require 'yaml'

class Library

  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/book_data.yml')
  end

  def list_books
    return @collection
  end
end
