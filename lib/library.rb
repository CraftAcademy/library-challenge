require 'yaml'

class Library
  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/book_collection.yml')
  end
  def book_list
    @collection.detect { |obj| obj[:item]}
  end
end
