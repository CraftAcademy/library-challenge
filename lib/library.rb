require 'yaml'

class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/book_collection.yml')
  end

end
